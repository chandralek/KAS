resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(tolist(aws_subnet.public-subnet.*.id))
  subnet_id      = element(tolist(aws_subnet.public-subnet.*.id),count.index )
  route_table_id = aws_route_table.public-rt.id
}