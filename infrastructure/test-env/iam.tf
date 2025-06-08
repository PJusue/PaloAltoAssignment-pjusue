module "ecs-task-execution-role-palo-alto-web-server" {
  source = "../../modules/iam"

  name = "ecs-task-execution-role-poc-PaloAlto"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })

  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
  ]

  tags = {
    Purpose = "ECS Task Execution for Palo Alto PoC"
  }
}

module "ecs-task-role-palo-alto-web-server" {
  source = "../../modules/iam"

  name = "ecs-task-role-poc-PaloAlto"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })

  policy_arns = [
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"

  ]

  tags = {
    Purpose = "ECS Task Execution for Palo Alto PoC"
  }
}

module "vpc-flow-logs-iam-role" {
  source = "../../modules/iam"

  name = "vpc-flow-logs-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      }
    }]
  })

  policy_arns = [
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  ]

  tags = {
    Purpose = "VPC Flow Logs for Palo Alto PoC"
  }

}

