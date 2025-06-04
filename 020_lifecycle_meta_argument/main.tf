/*
The `lifecycle` meta-argument is a special block that can be added to any 
resource block. It allows you to customize how Terraform handles the creation,
modification, and deletion of that resource.

The `lifecycle` block can contain multiple arguments. SOME of them are below.
*/


/*
`create_before_destroy`:
  - Type: `Boolean`
  - Default: `false`
  - Effect: When a change to an immutable attribute of a resource requires 
    that resource to be destroyed and recreated, Terraform's default behavior 
    is to destroy the old resource before creating the new one. Setting 
    `create_before_destroy = true` changes this behavior so that Terraform 
    creates the new resource before destroying the old one.
  - Use cases:
    - Minimizing downtime.
  - Considerations:
    - Some resources, such as S3 buckets, require unique names. Therefore, 
      Terraform will not be able to create the new resource before destroying 
      the old one. 
*/

resource "aws_instance" "web_server" {
  ami = "ami-abcdef0123456789" # Changing this will cause a destroy/create
  instance_type = "t2.micro"

  lifecycle {
    # This will create the new instance before destroying the old one
    create_before_destroy = true
  }
}


/*
`prevent_destroy`:
  - Type: `Boolean`
  - Default: `false`
  - Effect: Setting `prevent_destroy = true` will make Terraform throw an 
    error if you attempt to plan or apply a change that would destroy the 
    resource.
  - Use cases:
    - Protecting critical resources from accidental deletion.
  - Considerations:
    - As this setting only works if the `lifecycle` block is present, removing
      the entire resource block, which includes the `lifecycle` block, will
      still allow the resource to be destroyed.
    - Deleting the resource from outside of Terraform will still be possible.
    - For the above two reasons, this setting is not a substitute for cloud 
      provider-specific termination protection or IAM policies.
*/

resource "aws_s3_bucket" "critical_bucket" {
  bucket = "my-critical-bucket"

  lifecycle {
    # This will somewhat prevent the bucket from being destroyed via Terraform
    prevent_destroy = true
  }
}


/*
`ignore_changes`:
  - Type: `List(string)` or special keyword `all`
  - Effect: Allows you to specify a list of resource attributes that Terraform 
    should ignore when determining if the resource needs to be updated.
  - Use cases:
    - Ignoring changes made to attributes that are managed outside of 
      Terraform, e.g. tags.
    - Using `ignore_changes = all` to make Terraform create/destroy the 
      resource but never update it.
  - Considerations:
    - This setting only applies to the specified attributes and does not 
      prevent Terraform from managing the resource as a whole.
*/
resource "aws_instance" "web_server_2" {
  ami = "ami-abcdef0123456789"
  instance_type = "t2.micro"

  tags = {
    Name = "web-server"
    Environment = "prd" # This tag will be ignored by Terraform
  }

  lifecycle {
    # Ignore changes to the "Environment" tag
    ignore_changes = [
      tags["Environment"],
    ]
  }
}

resource "aws_instance" "web_server_3" {
  ami = "ami-abcdef0123456789"
  instance_type = "t2.micro"

  lifecycle {
    /*
    Ignore change to all attributes of the resource. Effectively, this will 
    make Terraform create/destroy the resource but never update it.
    */
    ignore_changes = all
  }
}