resource "aws_ecs_cluster" "main" {
  name = var.cluster_name

  dynamic "service_connect_defaults" {
    for_each = var.service_connect_defaults != null ? [var.service_connect_defaults] : []
    content {
      namespace = service_connect_defaults.value.namespace
    }
  }

  dynamic "setting" {
    for_each = var.settings
    content {
      name  = setting.value.name
      value = setting.value.value
    }
  }

  configuration {
    managed_storage_configuration {
      fargate_ephemeral_storage_kms_key_id = var.kms_key_id
    }
  }
  lifecycle {
    ignore_changes = [
      configuration[0].managed_storage_configuration[0].fargate_ephemeral_storage_kms_key_id
    ]
  }
  tags = var.tags
}