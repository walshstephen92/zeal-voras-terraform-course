/*
It's best practice to include the block below, specifying a provider version
to use, ensuring compatibility and stability.
For non-Hashicorp providers, it's not just a best practice, it's required.
*/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

/*
Then you can configure your provider(s).
A provider block with NO ALIAS creates a DEFAULT provider configuration.
*/
provider "aws" {
  region = "us-east-1"
}