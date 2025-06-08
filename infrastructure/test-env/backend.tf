terraform {
  backend "s3" {
    bucket  = "palo-alto-poc-proserve" # Change this s3 bucket for the one in which you want to store the tf state
    key     = "test-env/ecs/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
