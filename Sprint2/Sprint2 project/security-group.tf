resource "aws_security_group" "project-sg" {
  name        = "project-sg"
  description = "Allow ec2 inbound traffic"
  dynamic "ingress" {
    for_each = [80,8080,443]
    iterator = port
    content {
      description = "traffic from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}