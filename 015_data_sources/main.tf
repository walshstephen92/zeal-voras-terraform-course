/*
Data sources are used to fetch information about resources that already exist outside of your current Terraform configuration.
They are read-only and do not create or manage resources.
They are defined using the `data` block.
Each type of data source has its own set of arguments and attributes.
The example below uses the `aws_ami` data source to fetch the latest Amazon Linux 2 AMI.
*/

data "aws_ami" "latest_amazon_linux_2023_arm64" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-arm64"]
  }
}

/*
Given that data sources don't create resources, you can see the information they fetch in the Terraform state file or by creating an output.
*/
output "latest_amazon_linux_2023_arm64" {
  value = data.aws_ami.latest_amazon_linux_2023_arm64.id
}

/*
The `local_file` data source can be used to fetch the content of a file.
The `${path.module}` variable is a built-in variable that points to the directory where the current module is located.
*/
data "local_file" "example_file_content" {
  filename = "${path.module}/my_example_file.txt"
}

output "name_of_file" {
  value = data.local_file.example_file_content.filename
}

output "content_of_file" {
  value = data.local_file.example_file_content.content
}