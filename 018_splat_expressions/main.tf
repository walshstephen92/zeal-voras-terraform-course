/*
Splat expressions are a way to easily access attributes of multiple items
within a collection.

There are two types of splat expressions:

The index splat ([*]) is used when you have a list and you want to access a
specific attribute of every item in that list.
The result is a new list containing the values of that attribute for each item.
*/
resource "aws_instance" "server" {
  count = 3
  ami = "ami-xxxxxxxxx"
  instance_type = "t2.micro"
  tags = {
    Name = "server-${count.index + 1}"
  }
}

output "ip_addresses" {
  value = aws_instance.server[*].private_ip
  description = <<EOF
The value of this output would be a list like:
["10.0.1.10", "10.0.1.11", "10.0.1.12"]
EOF
}

/*
The attribute splat (.*) is used when you have a map of objects (or a resource
that returns a map of instances) and you want to access a specific attribute of
all the values in that map.
*/
resource "aws_security_group" "web_sg" {
  ingress = {
    http = {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    https = {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "from_ports" {
  value = aws_security_group.web_sg.ingress.*.from_port
  description = <<EOF
The value of this output will be a list of all the from_port values in the
ingress map, i.e. [80, 443]
EOF
}