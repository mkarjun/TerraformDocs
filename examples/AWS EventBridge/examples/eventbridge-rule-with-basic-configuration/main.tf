module "eventbridge_rule_cron" {
  source              = "../../"
  function            = "PGO-S3ECS"
  increment_code      = "0002"
  description         = "ScheduledRule"
  schedule_expression = "rate(1 hour)"
  eventbridge_targets = {
    lambda_target = {
      target_id  = "hello-world-python"
      target_arn = "arn:aws:lambda:us-east-1:<AccountID>:function:***"
      input = jsonencode({
        "key" : "value"
      })
    }
  }
}

module "eventbridge_rule_event_pattern" {
  source              = "../../"
  function            = "PGO-S3ECS"
  description         = "ScheduledRule"
  increment_code      = "0002"
  event_pattern = jsonencode({
    "detail-type" : ["AWS API Call via CloudTrail"],
    "source" : ["aws.cloudformation"],
    "detail" : {
      "eventSource" : ["cloudformation.amazonaws.com"],
      "eventName" : ["CreateStack"]
    }
  })
  eventbridge_targets = {
    lambda_target = {
      target_id  = "hello-world-python"
      target_arn = "arn:aws:lambda:us-east-1:<AccountID>:function:****"
      input = jsonencode({
        "key" : "value"
      })
    }
  }
}
