module "backup" {
  source              = "../../" 
  policy_scope        = "STD"
  expiry              = "1YR"
  increment_code      = "001"
  target_vault_name   = "VAULT"
  target_plan_name    = "BKPPLN"
  rules = [
    {
      rule_name         = "FirstBackupRule"
      target_vault_name = null
      schedule          = "cron(0 12 * * ? *)"
      start_window      = "60"
      completion_window = "180"
      recovery_point_tags = {
        Environment = "Dev"
      }
      lifecycle = {
        cold_storage_after = 90
        delete_after       = 360
      }
      copy_actions = [
        // {
        //   destination_vault_arn = "arn:aws:backup:us-::backup-vault:secondbackup"
        //   lifecycle = {
        //     cold_storage_after = 90
        //     delete_after       = 360
        //   }
        // }
      ]
    }
  ]
  selection_name = "MyBackupPlan"
  resources      = [""] 
  not_resources  = null
  selection_tags = [{
    type  = "STRINGEQUALS"
    key   = "foo"
    value = "bar"
  }]
  condition = {
    string_equals = {
      key    = null
      values = null
    }
    string_not_equals = {
      key   = null
      value = null
    }
    string_like = {
      key   = null
      value = null
    }

    string_not_like = {
      key   = null
      value = null
    }
  }
}
