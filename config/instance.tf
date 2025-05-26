module "config" {
  source = "git@github.com:reschouw-homelab/terraform-homelab.git//modules/aws-instance?ref=aws-instance-v4.1.0"
  
  hostname = "config"
  ami-name = "config-before-non-dmz"
  instance-type = "t4g.micro"
  disk-size = 12
  subnet = "us-west-2a"
  custom-security-group-ids = [aws_security_group.config.id]
}
