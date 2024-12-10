variable "environment" {
  default = "prod"
}

variable "project" {
  default = "cloud-burger"
}

variable "database_password" {
  default = ""
}

variable "database_instance_class" {
  default = "db.t3.micro"
}

variable "database_name" {
  default = "postgres"
}

variable "database_username" {
  default = "postgres"
}
