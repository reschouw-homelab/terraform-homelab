output "public-ip" {
  description = "The public IP address of the created instance"
  value = var.spot-instance ? aws_spot_instance_request.instance[0].public_ip : aws_instance.instance[0].public_ip
}

output "private-ip" {
  description = "The private IP address of the created instance"
  value = var.spot-instance ? aws_spot_instance_request.instance[0].private_ip : aws_instance.instance[0].private_ip
}

output "instance-id" {
  description = "The id of the created instance"
  value = var.spot-instance ? aws_spot_instance_request.instance[0].spot_instance_id : aws_instance.instance[0].id
}
