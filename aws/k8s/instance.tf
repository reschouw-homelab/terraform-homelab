module "controller" {
  #source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.2"
  source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "kube-controller-1"
  subnet = "us-west-2a"
  playbook = "kubernetes.yml"
  
  instance-type = "t3a.small"
}
