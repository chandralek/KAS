resource "aws_db_instance" "default" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6"
  instance_class       = "db.t2.micro"
  name                 = "mysqlnonprod"
  username             = "admin"
  password             = "admin"
  parameter_group_name = aws_db_parameter_group.mysql-db-parameter.name
  db_subnet_group_name = aws_db_subnet_group.mysql-subnet-group.name
}

resource "aws_db_parameter_group" "mysql-db-parameter" {
  family = "mysql5.6"
}

resource "aws_db_subnet_group" "mysql-subnet-group" {
  subnet_ids = tolist(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS)
}