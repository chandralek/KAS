terraform {
  backend "s3" {
    bucket = "tfstates-demo"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
