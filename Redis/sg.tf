data aws_vpc "vpc"{
  id = data.terraform_remote_state.vpc.outputs.VPC_ID
}

resource "aws_security_group" "allow_redis" {
  name          = "allow_redis"
  vpc_id        = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "TLS from VPC"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}