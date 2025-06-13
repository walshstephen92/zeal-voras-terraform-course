/*
The `for_each` meta-argument allows you to iterate over a set of values, or a map, to create multiple instances of a
resource or module.
*/
variable "names" {
  type    = set(string)
  default = ["Alice", "Bob", "Charlie"]
}

resource "aws_iam_user" "users" {
  # Set the `for_each` argument to the set being iterated over.
  for_each = var.names

  # Use `each.value` to access the current item in the iteration.
  name = each.value
}


/*
When using `for_each` to iterate over a map, you can access both the key and value using `each.key` and `each.value`.
*/
variable "environment_to_ami" {
  type = map(string)
  default = {
    dev = "ami-12345678"
    stg = "ami-87654321"
    prd = "ami-11223344"
  }
}

resource "aws_instance" "app_servers" {
  for_each = var.environment_to_ami

  ami           = each.value
  instance_type = "t2.micro"

  tags = {
    Name        = "AppServer-${each.key}"
    Environment = each.key
  }
}