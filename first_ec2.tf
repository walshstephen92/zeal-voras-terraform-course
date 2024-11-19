provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t3.micro"
  
  tags = {
    Name = "my-first-ec2"
  }
}