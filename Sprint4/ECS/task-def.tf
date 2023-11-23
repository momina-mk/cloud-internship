module "wordpress" {
    source = "cloudposse/ecs-container-definition/aws"
    container_name = "wp"
    container_image = "wordpress:php7.2"
    

}

resource "aws_ecs_task_definition" "wordpress" {
    
    container_definitions = module.wordpress.json_map_encoded_list
    family = "fargate"
    requires_compatibilities = [local.launch_type]
    cpu = "256"
    memory ="512"
    network_mode = "awsvpc"
}

