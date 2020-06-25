resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = data.aws_vpc.management.id
  vpc_id        = aws_vpc.main.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

