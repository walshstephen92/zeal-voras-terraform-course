resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t3.micro"

  tags = {
    Name = "my-first-ec2"
  }
}

resource "aws_instance" "my-canadian-ec2-instance" {
  # Use the Canadian AWS provider (declared in providers.tf)
  provider = aws.canadian-aws

  ami           = "ami-0bcda2433f3dabc41"
  instance_type = "t3.micro"

  tags = {
    Name = "my-canadian-ec2"
  }
}