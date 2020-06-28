resource "aws_db_instance" "default" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6"
  instance_class       = "db.t2.micro"
  name                 = "roboshop"
  username             = "roboshop"
  password             = "DevOps321"
  parameter_group_name = aws_db_parameter_group.mysql-db-parameter.name
  db_subnet_group_name = aws_db_subnet_group.mysql-subnet-group.name
  vpc_security_group_ids = [aws_security_group.allow_mysql.id]
}

data aws_vpc "vpc"{
  id = data.terraform_remote_state.vpc.outputs.VPC_ID
}

resource "aws_security_group" "allow_mysql" {
  name          = "allow_mysql"
  vpc_id        = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
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
    Name = "allow_mysql"
  }
}

resource "aws_db_parameter_group" "mysql-db-parameter" {
  family = "mysql5.6"
}

resource "aws_db_subnet_group" "mysql-subnet-group" {
  subnet_ids = tolist(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS)
}

