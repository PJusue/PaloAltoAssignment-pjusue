
module "alb-palo-alto" {
  source          = "../../modules/load-balancer"
  name            = "alb-palo-alto-poc"
  internal        = false
  vpc_id          = module.vpc-palo-alto.vpc_id
  subnets         = module.vpc-palo-alto.public_subnets
  security_groups = [module.alb-sg-poc-palo-alto.id] 

  target_groups = [
    {
      port        = 80
      protocol    = "HTTP"
      target_type = "ip"
      health_check = {
        enabled             = true
        healthy_threshold   = 2
        interval            = 30
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 5
        unhealthy_threshold = 2
      }
    }
  ]

  # Listener for 443 need to be uncomented when ACM cert validation is possible, so the communication is encrypted using SSL
  listeners = [
    # {
    #   port            = 443
    #   protocol        = "HTTPS"
    #   ssl_policy      = "ELBSecurityPolicy-2016-08"
    #   certificate_arn = module.acm_palo_alto.arn
    #   default_action = {
    #     type               = "forward"
    #     target_group_index = 0
    #     redirect          = null
    #   }
    # },
    {
      port            = 80
      protocol        = "HTTP"
      ssl_policy      = null
      certificate_arn = null
      default_action = {
        type               = "forward"
        target_group_index = 0
        redirect           = null
      }
    }
  ]

  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"

  }
}