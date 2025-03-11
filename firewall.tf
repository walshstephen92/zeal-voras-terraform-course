# New approach: separates the rules into different resources.
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Managed from Terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_from_all_ipv4" {
  security_group_id = aws_security_group.my_security_group.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_to_all_ipv4" {
  security_group_id = aws_security_group.my_security_group.id
  ip_protocol       = "-1" # equivalent to "all ports / protocols"
  cidr_ipv4         = "0.0.0.0/0"
}



# Old approach: all rules in the same resource.
resource "aws_security_group" "old_security_group" {
  name        = "old-security-group"
  description = "Managed from Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}