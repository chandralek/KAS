data "aws_availability_zones" "available" {
  state = "available"
}


data "aws_vpc" "management" {
  id = "vpc-9dc3a5e5"
}