resource "aws_eip" "my_ip_2" {
  domain = "vpc"
}

output "my_ip_address" {
  value = aws_eip.my_ip_2.public_ip
}

output "my_8080_url" {
  value = "http://${aws_eip.my_ip_2.public_ip}:8080"
}