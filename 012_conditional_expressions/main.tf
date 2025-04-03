variable "environment" {
  type    = string
  default = "dev"
}

variable "small_unless_specified" {
  type    = string
  default = null
}

variable "is_prd" {
  type    = bool
  default = false
}

variable "region" {
  type    = string
  default = "us-east-1"
}

/*
A conditional expression is a shorthand way of writing an if-else statement.
It has the form condition ? true_value : false_value.
*/
resource "aws_instance" "instance_1" {
  ami           = "ami-12345678"
  instance_type = (var.environment == "dev") ? "t2.small" : "t2.large"   
}

/*
You can use negation in the condition.
*/
resource "aws_instance" "instance_2" {
  ami           = "ami-12345678"
  instance_type = (var.environment != "dev") ? "t2.large" : "t2.small"   
}

/*
You can check if a variable is set to null.
*/
resource "aws_instance" "instance_3" {
  ami           = "ami-12345678"
  instance_type = (var.small_unless_specified == null) ? "t2.small" : "t2.large"   
}

/*
You can use a boolean variable to control the conditional expression.
*/
resource "aws_instance" "instance_4" {
  ami           = "ami-12345678"
  instance_type = (var.is_prd) ? "t2.large" : "t2.small"   
}

/*
You can use multiple conditional expressions with an "and" operator...
*/
resource "aws_instance" "instance_5" {
  ami           = "ami-12345678"
  instance_type = (var.is_prd && (var.region == "us-east-1")) ? "t2.large" : "t2.small"   
}

/*
...or an "or" operator.
*/
resource "aws_instance" "instance_6" {
  ami           = "ami-12345678"
  instance_type = (var.is_prd || (var.region == "us-east-1")) ? "t2.large" : "t2.small"   
}