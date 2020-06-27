resource "aws_instance" "web" {
  ami           = "ami-0c84a3e93390c29bc"
  instance_type = "t3.medium"

  tags = {
    Name = "jenkins"
  }
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
}