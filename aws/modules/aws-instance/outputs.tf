output "public-ip" {
  description = "The public IP address of the created instance"
  value = aws_instance.instance.public_ip
}

output "public-dns" {
  description = "The public DNS name assigned to the created instance"
  value = aws_instance.instance.public_dns
}
