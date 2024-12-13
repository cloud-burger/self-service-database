resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
}
