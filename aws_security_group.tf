resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.main.id

  # Permitir todo o tráfego de entrada TCP
  ingress {
    from_port   = 0
    to_port     = 65535 # Portas TCP variam de 0 a 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir tráfego de saída para a Internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_public_sg" {
  name        = "rds_public_sg"
  description = "Allow postgres inbound traffic"
  vpc_id      = aws_vpc.main.id

  # Permitir tráfego de entrada apenas nas portas necessárias
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ssm_endpoint_sg" {
  name   = "ssm_endpoint_sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite tráfego de entrada de qualquer lugar
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Permite todo o tráfego de saída para qualquer lugar
  }
}
