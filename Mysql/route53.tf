resource "aws_route53_record" "www" {
  zone_id = "Z06359783V969HYMH8KRR"
  name    = "mysql-nonprod.devops46.online"
  type    = "A"
  ttl     = "5"
  records = [aws_db_instance.default.address]
}

