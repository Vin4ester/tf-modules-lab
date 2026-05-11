resource "aws_security_group" "ssh" {
  name   = var.ssh_security_group_name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.ssh.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group_rule" "ssh_egress" {
  type              = "egress"
  security_group_id = aws_security_group.ssh.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "public_http" {
  name   = var.public_http_security_group_name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "public_http_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.public_http.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group_rule" "public_http_egress" {
  type              = "egress"
  security_group_id = aws_security_group.public_http.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "private_http" {
  name   = var.private_http_security_group_name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "private_http_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_http.id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_http.id
}

resource "aws_security_group_rule" "private_http_egress" {
  type              = "egress"
  security_group_id = aws_security_group.private_http.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
