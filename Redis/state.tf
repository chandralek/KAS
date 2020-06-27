terraform {
  backend "s3" {
    bucket = "tfstates-demo"
    key    = "prod/redis/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-locking"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-state-prod"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-west-2"
  }
}