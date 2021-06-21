module "nat" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.4"
  
  hostname = "nat"
  subnet = "us-west-2-dmz"
  playbook = "nat.yml"
  associate-public-ip = true
  ip-address = "10.1.4.10"
  source-dest-check = false
}
