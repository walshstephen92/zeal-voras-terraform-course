resource "aws_eip" "my_ip" {
  domain = "vpc"
}

resource "aws_security_group" "my_sg" {
  name = "my_security_group"
}

/*
The inbound rule below references the "id" attribute of the security group
and the "public_ip" attribute of the elastic IP.
*/
resource "aws_vpc_security_group_ingress_rule" "my_inbound_rule" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "${aws_eip.my_ip.public_ip}/32"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}