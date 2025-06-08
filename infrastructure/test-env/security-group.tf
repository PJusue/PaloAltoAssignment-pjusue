module "alb-sg-poc-palo-alto" {
  source = "../../modules/security-groups"

  name        = "alb_sg_palo_alto_poc"
  description = "Security group for ALB"
  vpc_id      = module.vpc-palo-alto.vpc_id

  ingress_rules = [
    {
      description = "Allow HTTPS from anywhere"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP from anywhere"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
  }
}

module "ecs-service-sg" {
  source = "../../modules/security-groups"

  name        = "ecs_service_sg_palo_alto_poc"
  description = "Security group for ECS service"
  vpc_id      = module.vpc-palo-alto.vpc_id

  ingress_rules = [
    {
      description = "Allow traffic from ALB"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"
  }
}
