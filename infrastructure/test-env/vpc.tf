module "vpc-palo-alto" {
  source                   = "../../modules/vpc"
  name                     = "palo-alto-poc"
  vpc_cidr                 = "10.0.0.0/16"
  azs                      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets          = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets           = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway       = true
  enable_flow_logs         = true
  flow_logs_retention_days = 30
  iam_role_arn             = module.vpc-flow-logs-iam-role.role_arn
  tags = {
    Environment = "test"
    Project     = "ECS-PaloAlto"
    Terraform   = "true"
  }
  depends_on = [module.vpc-flow-logs-iam-role.role_arn]
}