resource "aws_spot_fleet_request" "workers" {
  iam_fleet_role = aws_iam_role.spot-fleet.arn
  allocation_strategy = "lowestPrice"
  instance_pools_to_use_count = 2
  instance_interruption_behaviour = "terminate"
  replace_unhealthy_instances = true
  terminate_instances_with_expiration = true
  wait_for_fulfillment = true
  target_capacity = 3

  dynamic "launch_specification" {
    for_each = data.aws_subnet.subnet
    iterator = each
    content {
      ami = data.aws_ami.k8s-worker.id
      instance_type = "t4g.small"
      subnet_id = each.value.id
      vpc_security_group_ids = [aws_security_group.kube-worker.id]
			iam_instance_profile = aws_iam_instance_profile.worker-bootstrap.name 
      root_block_device {
        volume_size = 8
      }
      user_data = templatefile("${path.module}/userdata.cfg",{
        k8s-join-token = local.k8s-join-token,
        k8s-join-hash = local.k8s-join-hash,
        kube-controller-ip = module.controller.private-ip,
      })
      tags = {
        terraform = true
        spot = true
        Name = "kube-worker.dorwinia.com"
      }
    }
  }

  # Since worker nodes need to join to the controller, it must exist and have dns pointing to it. 
  # Note that this may still fail if the controller is being spun up for the first time and is initializing the cluster
  depends_on = [module.controller, aws_route53_record.control-plane]

  tags = {
    terraform = true
  }
}
