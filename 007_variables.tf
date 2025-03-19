variable "ip_protocol" {
    type = string
    default = "tcp"
}

variable "app_port" {
    type = number
    default = 8080
}

variable "ssh_port" {
    type = number
    default = 22
}

variable "ftp_port" {
    type = number
    default = 21
}

variable "vpn_ipv4" {
    type = string
    default = "101.20.30.50/32"
    description = "This is an example of a VPN server's IP address."
}