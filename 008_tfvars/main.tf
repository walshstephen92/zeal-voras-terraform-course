data "aws_ami" "latest_AL2023_ARM64" {
  most_recent = true

  filter {
    name = "name"
    values = ["al2023-ami-2023.*-arm64"]
  }

  filter {
    name = "architecture"
    values = ["arm64"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "my_ec2_instance" {
  instance_type = var.instance_size
  ami = data.aws_ami.latest_AL2023_ARM64.id
}