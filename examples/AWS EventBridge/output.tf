output "eventbridge_rule_id" {
  description = "The EventBridge Rule ID created"
  value       = aws_cloudwatch_event_rule.event_rule.id
}
