resource "aws_vpc_endpoint" "ssm_endpoint" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.us-east-2.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ssm_endpoint_sg.id]
  subnet_ids          = [aws_subnet.private_subnet.id]
}
