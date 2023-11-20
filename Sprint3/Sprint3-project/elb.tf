# resource "aws_lb" "s3_lb" {
#   name               = "s3-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.ssh-access.id]
#   subnets            = [aws_subnet.s3-subnet.id]
#   depends_on         = [aws_internet_gateway.s3_gw]
# }
