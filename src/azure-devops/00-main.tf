terraform {
  required_version = ">= 1.1.5"

  backend "s3" {
    bucket         = "terraform-backend-5480"
    key            = "uat/devops/webapp/tfstate"
    region         = "eu-south-1"
    dynamodb_table = "terraform-lock"
  }

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "= 0.1.8"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.10.0"
    }

  }
}

provider "aws" {
  profile = "ppa-tokenizer-data-vault-uat"
  region  = var.region
}

# todo: change this for production
provider "aws" {
  alias   = "prod"
  profile = "ppa-tokenizer-data-vault-uat"
  region  = var.region
}