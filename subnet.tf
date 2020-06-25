resource "aws_subnet" "public-subnet" {
  count             = data.aws_availability_zones.available.names
  vpc_id            = aws_vpc.main.id
  availability_zone = element(data.aws_availability_zones.available.names,count.index)
  cidr_block        = cidrsubnet(var.CIDR_BLOCK_VPC, 8, count.index)

  tags = {
    Name            = "public-subnet-"+count.index
  }
}