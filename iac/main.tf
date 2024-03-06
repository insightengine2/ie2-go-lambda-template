terraform {

    required_version = "~> 1.1.0"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0.0"
        }
    }

    // comment out the following block 
    backend "s3" {
        bucket  = "${var.iac-bucket}"
        key     = "state/lambdas/${var.lambda-name}/${var.tag-environment}/terraform.tfstate"
        region  = "${var.region}"
    }
}

provider "aws" {
    
    region = var.region

    default_tags {
        tags = {
            Environment = var.tag-environment
            Name        = var.tag-project
        }
    }
}

## ROOT PROJECT STATE
##  Useful if you need to reference outputs from the root infrastructure, like referencing ARNs
data "terraform_remote_state" "lambda-state" {
    backend = "s3"
    config = {
        bucket  = "${var.iac-bucket}"
        key     = "state/terraform.tfstate"
        region  = "${var.region}"
    }
}