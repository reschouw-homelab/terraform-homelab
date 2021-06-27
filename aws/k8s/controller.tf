module "controller" {
  #source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.5"
  source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "kube-con-1"
  subnet = "us-west-2a"
  playbook = "kubernetes.yml"
  
  instance-type = "t4g.small"
}
