module "nat" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.2"
  
  hostname = "nat"
  subnet = "us-west-2a"
  playbook = "nat.yml"
  associate-public-ip = true
  ip-address = "10.1.0.10"
  
  instance-type = "t3a.nano"
}
