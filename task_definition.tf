resource "aws_ecs_task_definition" "wordpress" {
  family                   = "wordpress"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name  = "wordpress"
      image = "wordpress:latest"
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
      ]
      environment = [
        {
          name  = "WORDPRESS_DB_HOST"
          value = "your-db-host"
        },
        {
          name  = "WORDPRESS_DB_USER"
          value = "admin"
        },
        {
          name  = "WORDPRESS_DB_PASSWORD"
          value = "pakistan"
        },
        {
          name  = "WORDPRESS_DB_NAME"
          value = "myterraform"
        },
      ]
    },
  ])
}
