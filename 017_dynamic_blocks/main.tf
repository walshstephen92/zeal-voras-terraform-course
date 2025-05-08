/*
Dynamic blocks are used to create multiple similar blocks without actually
repeating yourself.

A simple example is creating multiple rules for a security group.
*/

variable "ingress_rules" {
  description = "List of ingress rules for the security group"

  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.1.0/24"]
    }
  ]
}

resource "aws_security_group" "example_sg" {
  name = "example-sg"

  /*
  The Dynamic block name, "ingress" in this case, must be the same as the block
  name accepted by the resource, e.g. the "aws_security_group" resource accepts
  "ingress" blocks.
  */
  dynamic "ingress" {

    /*
    The for_each argument is used to set the list of items to iterate over.
    */
    for_each = var.ingress_rules

    /*
    The content block is used to define the content of the dynamic block.
    */
    content {
      /*
      By default, to substitute the value of a variable in a dynamic block, you
      use: <dynamic_block_name>.value.<attribute_name>
      */
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  /*
  But you can also set the "iterator" argument to customize the name of the
  temporary variable used to access the current element being iterated over.
  */
  dynamic "ingress" {
    for_each = var.ingress_rules
    iterator = ingress_rule

    content {
      from_port   = ingress_rule.value.from_port
      to_port     = ingress_rule.value.to_port
      protocol    = ingress_rule.value.protocol
      cidr_blocks = ingress_rule.value.cidr_blocks
    }
  }
}