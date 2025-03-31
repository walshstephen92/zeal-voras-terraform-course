/*
The count argument is used to specify the number of resources, data sources or modules to create.
The index of the resource is available using the count.index variable.
*/
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  count = 3

  tags = {
    Name = "example-${count.index}"
  }
}

/*
The count.index can be combined with a list to use a custom string for each resource.
We're also setting the count to the length of the list.
*/
variable "user_names" {
  type    = list(string)
  default = ["alice", "bob", "charlie"]
}

resource "aws_iam_user" "user" {
    name = var.user_names[count.index]
    count = length(var.user_names)    
}