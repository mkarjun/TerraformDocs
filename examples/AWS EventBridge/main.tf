locals {
  event_bridge_name = "CWR-${var.function}-${var.increment_code}"
}

resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = local.event_bridge_name
  description         = var.description
  is_enabled          = var.is_enabled
  event_pattern       = var.event_pattern
  schedule_expression = var.schedule_expression
  role_arn            = var.role_arn
}

resource "aws_cloudwatch_event_target" "main" {
  for_each   = var.eventbridge_targets
  rule       = aws_cloudwatch_event_rule.event_rule.id
  target_id  = lookup(each.value, "target_id", null)
  arn        = each.value.target_arn
  role_arn   = lookup(each.value, "role_arn", null)
  input      = lookup(each.value, "input", null)
  input_path = lookup(each.value, "input_path", null)

  dynamic "ecs_target" {
    for_each = lookup(each.value, "ecs_target", null) != null ? [each.value.ecs_target] : []
    content {
      group               = lookup(ecs_target.value, "group", null)
      launch_type         = lookup(ecs_target.value, "launch_type", null)
      platform_version    = lookup(ecs_target.value, "platform_version", null)
      task_count          = lookup(ecs_target.value, "task_count", null)
      task_definition_arn = ecs_target.value.task_definition_arn

      dynamic "network_configuration" {
        for_each = lookup(ecs_target.value, "network_configuration", null) != null ? [ecs_target.value.network_configuration] : []
        content {
          subnets          = network_configuration.value.subnets
          security_groups  = lookup(network_configuration.value, "security_groups", null)
          assign_public_ip = lookup(network_configuration.value, "assign_public_ip", null)
        }
      }
    }
  }

  dynamic "input_transformer" {
    for_each = lookup(each.value, "input_transformer", null) != null ? [each.value.input_transformer] : []
    content {
      input_paths    = input_transformer.value.input_paths
      input_template = input_transformer.value.input_template
    }
  }

  dynamic "dead_letter_config" {
    for_each = lookup(each.value, "dead_letter_arn", null) != null ? [true] : []
    content {
      arn = each.value.dead_letter_arn
    }
  }

  dynamic "retry_policy" {
    for_each = lookup(each.value, "retry_policy", null) != null ? [each.value.retry_policy] : []
    content {
      maximum_event_age_in_seconds = retry_policy.value.maximum_event_age_in_seconds
      maximum_retry_attempts       = retry_policy.value.maximum_retry_attempts
    }
  }
}
