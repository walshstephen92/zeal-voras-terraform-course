/*
`depends_on` is a meta-argument used to explicitly define dependencies between
resources. Terraform can usually infer dependences based on references, but 
`depends_on` is useful when:
  - dependencies are not obvious from the resource configuration
  - you want to enforce a specific order of resource creation

In this example, we have two resources: `aws_instance.web` and 
`aws_db_instance.db`. The database must be create before the web server as in
a real-world scenario, the web server would connect to the database in its 
userdata script.
*/

resource "aws_instance" "web_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  # This EC2 instance depends on the db instance being created first
  depends_on = [aws_db_instance.database]
}

resource "aws_db_instance" "database" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  username          = "master"
}

/*
When resource A depends on resource B, as well as ensuring that resource B is 
created before resource A, Terraform will also ensure that the resources are
destroyed in the reverse order.
*/