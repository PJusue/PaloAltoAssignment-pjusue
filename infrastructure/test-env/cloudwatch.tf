module "ecs_cpu_alarm" {
  source = "../../modules/cloudwatch-alarms"

  alarm_name          = "ecs-cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  statistic           = "Average"
  threshold           = 85
  alarm_description   = "CPU utilization has exceeded 85%"
  alarm_actions       = [module.alerts-sns-topic.arn]
  dimensions = {
    ClusterName = module.ecs-cluster.cluster_name
    ServiceName = module.ecs-service-palo-alto.service_name
  }
  depends_on = [module.alerts-sns-topic.arn]
}

module "ecs_memory_alarm" {
  source = "../../modules/cloudwatch-alarms"

  alarm_name          = "ecs-memory-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  statistic           = "Average"
  threshold           = 85
  alarm_description   = "Memory utilization has exceeded 85%"
  alarm_actions       = [module.alerts-sns-topic.arn]
  dimensions = {
    ClusterName = module.ecs-cluster.cluster_name
    ServiceName = module.ecs-service-palo-alto.service_name
  }
  depends_on = [module.alerts-sns-topic.arn]
}

module "ecs_tasks_alarm" {
  source = "../../modules/cloudwatch-alarms"

  alarm_name          = "ecs_running_tasks_low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "RunningTaskCount"
  namespace           = "AWS/ECS"
  statistic           = "Average"
  threshold           = 2
  alarm_description   = "Number of running tasks is less than 2"
  alarm_actions       = [module.alerts-sns-topic.arn]
  dimensions = {
    ClusterName = module.ecs-cluster.cluster_name
    ServiceName = module.ecs-service-palo-alto.service_name
  }
  depends_on = [module.alerts-sns-topic.arn]
}
