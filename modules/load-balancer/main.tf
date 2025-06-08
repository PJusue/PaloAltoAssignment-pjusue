
resource "aws_lb" "main" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets

  tags = var.tags
}

resource "aws_lb_target_group" "main" {
  count       = length(var.target_groups)
  name        = "${var.name}-tg-${count.index}"
  port        = var.target_groups[count.index].port
  protocol    = var.target_groups[count.index].protocol
  vpc_id      = var.vpc_id
  target_type = var.target_groups[count.index].target_type

  dynamic "health_check" {
    for_each = [var.target_groups[count.index].health_check]
    content {
      enabled             = health_check.value.enabled
      healthy_threshold   = health_check.value.healthy_threshold
      interval            = health_check.value.interval
      matcher             = health_check.value.matcher
      path                = health_check.value.path
      port                = health_check.value.port
      protocol            = health_check.value.protocol
      timeout             = health_check.value.timeout
      unhealthy_threshold = health_check.value.unhealthy_threshold
    }
  }

  tags = var.tags
}

resource "aws_lb_listener" "main" {
  count             = length(var.listeners)
  load_balancer_arn = aws_lb.main.arn
  port              = var.listeners[count.index].port
  protocol          = var.listeners[count.index].protocol
  ssl_policy        = var.listeners[count.index].ssl_policy
  certificate_arn   = var.listeners[count.index].certificate_arn

  dynamic "default_action" {
    for_each = [var.listeners[count.index].default_action]
    content {
      type             = default_action.value.type
      target_group_arn = default_action.value.type == "forward" ? aws_lb_target_group.main[default_action.value.target_group_index].arn : null

      dynamic "redirect" {
        for_each = default_action.value.type == "redirect" ? [default_action.value.redirect] : []
        content {
          port        = redirect.value.port
          protocol    = redirect.value.protocol
          status_code = redirect.value.status_code
        }
      }
    }
  }
}
