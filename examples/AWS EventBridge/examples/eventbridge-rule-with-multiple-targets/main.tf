module "EventBridgeRule" {
  source              = "../../"
  function            = "PGO-S3ECS"
  description         = "ScheduledRule"
  increment_code      = "0001"
  schedule_expression = "rate(1 hour)"
  eventbridge_targets = {
    lambda_target = {
      target_id  = "hello-world-python"
      target_arn = "arn:aws:lambda:us-east-1:<AccountID>:function:****"
      input = jsonencode({
        "key" : "value"
      })
    },
    lambda_target_1 = {
      target_id  = "hello-world-python"
      target_arn = "arn:aws:lambda:us-east-1:<AccountID>:function:****"
      retry_policy = {
        maximum_event_age_in_seconds = "3600"
        maximum_retry_attempts       = "3"
      }
    },
    event_bus = {
      target_id  = "eventbridgeTest"
      target_arn = "arn:aws:events:us-east-1:<AccountID>:event-bus/***"
      role_arn   = "arn:aws:iam::<AccountID>:role/****"
    }
  }
}
