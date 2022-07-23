module "module-test" {
  #source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.2"
  source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true

  hostname = "module-test"
  subnet = "us-west-2a"
  associate-public-ip-address = true
  associate-elastic-ip-address = true
}

