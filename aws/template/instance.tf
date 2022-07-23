module "module-test" {
  source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true

  hostname = "module-test"
  subnet = "us-west-2a"
  associate-public-ip-address = true
  associate-elastic-ip-address = true
}

