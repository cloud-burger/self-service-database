resource "aws_ssm_parameter" "database_host" {
  name  = "/prod/${var.project}/database_host"
  value = aws_db_instance.postgres.endpoint
  type  = "String"
}

resource "aws_ssm_parameter" "database_name" {
  name  = "/prod/${var.project}/database_name"
  value = var.database_name
  type  = "String"
}

resource "aws_ssm_parameter" "database_username" {
  name  = "/prod/${var.project}/database_username"
  value = var.database_username
  type  = "String"
}

resource "aws_ssm_parameter" "database_password" {
  name  = "/prod/${var.project}/database_password"
  value = var.database_password
  type  = "SecureString"
}
