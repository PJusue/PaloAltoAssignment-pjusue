data "aws_caller_identity" "current" {}

locals{
  container_image="nginxdemos/hello"
}
module "ecs-cluster" {
  source = "../../modules/ecs/cluster"

  cluster_name             = "test-cluster"
  service_connect_defaults = null
  settings = [
    {
      name  = "containerInsights"
      value = "enabled"
    }
  ]
  kms_key_id = module.kms_fargate_ephemeral_storage.key_id

  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
  }
}
module "ecs-task-definition-palo-alto" {
  source                   = "../../modules/ecs/task-definition"
  task_definition_family   = "palo-alto-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_cpu                 = 1024
  task_memory              = 2048
  execution_role_arn       = module.ecs-task-execution-role-palo-alto-web-server.role_arn
  task_role_arn            = module.ecs-task-role-palo-alto-web-server.role_arn
  container_cpu            = 512
  container_memory         = 1024
  container_image          = local.container_image
  container_name           = "PoC-container-nginx"
  logConfiguration = {
    logDriver = "awslogs"
    options = {
      "awslogs-group"         = "/ecs/palo-alto-service"
      "awslogs-region"        = "us-west-2"
      "awslogs-stream-prefix" = "ecs"
      "awslogs-create-group"  = "true"
    }
  }
  portMappings = [
    {
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }
  ]
}

module "ecs-service-palo-alto" {
  source              = "../../modules/ecs/service"
  name                = "palo-alto-service"
  cluster_id          = module.ecs-cluster.cluster_id
  task_definition_arn = module.ecs-task-definition-palo-alto.task_definition_arn
  desired_count       = 2
  launch_type         = "FARGATE"
  iam_role            = null

  ordered_placement_strategy = []

  # Load balancer configuration
  load_balancer = {
    target_group_arn = module.alb-palo-alto.target_group_arns[0]
    container_name   = "PoC-container-nginx"
    container_port   = 80
  }

  # Placement constraints are not applicable for Fargate, so we'll leave this empty
  placement_constraints = []

  # Network configuration
  network_configuration = {
    subnets          = module.vpc-palo-alto.private_subnets
    security_groups  = [module.ecs-service-sg.id]
    assign_public_ip = false
  }

  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"
  }
}

# Create Application Auto Scaling for ECS Service
module "ecs_autoscaling" {
  source = "../../modules/ecs/autoscaling"

  name = "ecs-scaling-${module.ecs-service-palo-alto.name}"

  cluster_name = module.ecs-cluster.cluster_name
  service_name = module.ecs-service-palo-alto.name

  min_capacity = 1
  max_capacity = 4

  scaling_policies = [
    {
      name               = "cpu-tracking"
      policy_type       = "TargetTrackingScaling"
      target_value      = 70.0
      scale_in_cooldown  = 300
      scale_out_cooldown = 300
      predefined_metric_specification = {
        predefined_metric_type = "ECSServiceAverageCPUUtilization"
      }
    },
    {
      name               = "memory-tracking"
      policy_type       = "TargetTrackingScaling"
      target_value      = 70.0
      scale_in_cooldown  = 300
      scale_out_cooldown = 300
      predefined_metric_specification = {
        predefined_metric_type = "ECSServiceAverageMemoryUtilization"
      }
    }
  ]

  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"
  }
}
