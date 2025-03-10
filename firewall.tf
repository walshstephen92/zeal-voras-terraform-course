resource "aws_security_group" "allow_tls" {
    name = "terraform-firewall"
    description = "Managed from Terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
    ip_protocol = "tcp"
    security_group_id = aws_security_group.allow_tls.id
    from_port = 80
    to_port = 80
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.allow_tls.id
    ip_protocol = "-1" # equivalent to "all ports / protocols"
    cidr_ipv4 = "0.0.0.0/0"
}