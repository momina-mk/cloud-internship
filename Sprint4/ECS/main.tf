locals {
  application_name = "tf-fargate"
  launch_type      = "FARGATE"
}
resource "aws_ecs_cluster" "this" {
  name = local.application_name
  tags = {
    Name ="wordpress"
    Owner = "Momina"
  }

}
resource "aws_ecs_service" "this" {
    name = "wordpress"
    cluster = aws_ecs_cluster.this.arn
    launch_type = local.launch_type
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 0
    desired_count = 1
    task_definition = aws_ecs_task_definition.wordpress.family
    network_configuration {
      assign_public_ip = true
      security_groups = [aws_security_group.wordpress.id]
      subnets = module.vpc.public_subnets
    }
    }
