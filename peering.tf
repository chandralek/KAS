resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = data.aws_vpc.management.id
  vpc_id        = aws_vpc.main.id
  auto_accept   = true
}

