module "EventBridgeRule" {
  source              = "../../"
  function            = "PGO-S3ECS"
  description         = "ScheduledRule"
  increment_code      = "0001"
  schedule_expression = "rate(1 hour)"
  eventbridge_targets = {
    ecs_target = {
      target_arn = "arn:aws:ecs:us-east-1:<AccountID>:cluster/****"
      role_arn   = "arn:aws:iam::<AcountID>:role/****"
      ecs_target = {
        target_id           = "Test2"
        task_definition_arn = "arn:aws:ecs:us-east-1:<AcountID>:task-definition/****"
        network_configuration = {
          subnets = ["subnet-ID"]
        }
      }
    }
  }
}