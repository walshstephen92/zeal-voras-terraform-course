resource "aws_security_group" "my_security_group_007" {
    name = "My security group"
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
    ip_protocol = var.ip_protocol
    security_group_id = aws_security_group.my_security_group_007.id
    from_port = var.app_port
    to_port = var.app_port
    cidr_ipv4 = var.vpn_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
    ip_protocol = var.ip_protocol
    security_group_id = aws_security_group.my_security_group_007.id
    from_port = var.ssh_port
    to_port = var.ssh_port
    cidr_ipv4 = var.vpn_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
    ip_protocol = var.ip_protocol
    security_group_id = aws_security_group.my_security_group_007.id
    from_port = var.ftp_port
    to_port = var.ftp_port
    cidr_ipv4 = var.vpn_ipv4
}