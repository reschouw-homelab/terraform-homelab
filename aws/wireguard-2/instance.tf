module "wireguard-2" {
  source = "../modules/aws-instance"
  
  hostname = "wireguard-2"
  ip-address = "10.1.0.10"
}
