module "alerts-sns-topic" {
  source = "../../modules/sns"

  name         = "ecs-alerts-topic"
  display_name = "ECS Alerts"
  tags = {
    Environment = "Production"
    Project     = "ECS-PaloAlto"
  }
  subscriptions = [
    {
      protocol = "email"
      endpoint = "test@test-paloalto.com"
    }
  ]
}
