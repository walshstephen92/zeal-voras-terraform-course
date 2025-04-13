/*
Locals are named values within a module.
They are used to avoid repetition and to simplify complex expressions.
They are scoped to the module in which they are defined.
Unlike variables, their values cannot be overridden by inputs.
They are defined using one or more "locals" blocks.
*/

locals {
  tags = {
    "Project" = "My webapp"
    "Owner"   = "John Doe"
  }
}

/*
While they are defined in a "locals" block, they are referenced using "local".
*/
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = local.tags
}

/*
Unlike variables, they can be defined using dynamic expressions.
*/
locals {
  phone_numbers = {
    "John Doe"  = "+1-555-1234"
    "Jane Doe"  = "+1-555-5678"
    "Bob Smith" = "+1-555-8765"
  }

  bobs_phone_number = lookup(local.phone_numbers, "Bob Smith", "Could not find Bob's phone number.")
}

output "bobs_phone_number" {
  value = local.bobs_phone_number
}