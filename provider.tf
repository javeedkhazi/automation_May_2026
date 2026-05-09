terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"

  assume_role {
    role_arn = "arn:aws:iam::262510459344:role/terraform-admin-role"
  }

}
