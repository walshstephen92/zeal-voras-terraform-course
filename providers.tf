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
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
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

/*
A provider block with an ALIAS allows you to use MULTIPLE provider
configurations from the SAME provider.
*/
provider "aws" {
  alias  = "canadian-aws"
  region = "ca-central-1"
}

/*
Azure provider. This will cause Terraform to download the Azure provider
plugin.
*/
provider "azurerm" {}