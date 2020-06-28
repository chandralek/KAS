resource "aws_elasticache_cluster" "redis" {
  cluster_id            = "redis-cluster-nonprod)}"
  engine                = "redis"
  node_type             = "cache.t3.micro"
  num_cache_nodes       = "1"
  parameter_group_name  = aws_elasticache_parameter_group.redis-5-0-6-pg.name
  engine_version        = "5.0.6"
  port                  = 6379
  subnet_group_name     = aws_elasticache_subnet_group.redis-subnet-group-name.name
  security_group_ids    = [aws_security_group.allow_redis.id]
}

resource "aws_elasticache_parameter_group" "redis-5-0-6-pg" {
  name   = "redis-5-0-6-parameter-group"
  family = "redis5.0"
}

resource "aws_elasticache_subnet_group" "redis-subnet-group-name" {
  name       = "redis-subnet-group.name"
  subnet_ids = tolist(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS)
}