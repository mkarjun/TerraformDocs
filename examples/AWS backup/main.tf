locals {

  # Rule
  is_rule_present = var.rule_info == null ? false : true
  rule            = local.is_rule_present ? [var.rule_info] : []

  rules             = concat(local.rule, var.rules)
  backup_vault_name = "VAULT-${var.target_vault_name}-${var.policy_scope}-${var.incremental_number}"

  backup_plan_name = "BKPPLN-${var.target_plan_name}-${var.policy_scope}-${var.expiry}-${var.incremental_number}"

  # Selection
  is_selection_tags_present = var.selection_tags == null ? false : true
  selection_tags            = local.is_selection_tags_present ? var.selection_tags : []

  is_condition_present = var.condition == null ? false : true
  condition            = local.is_condition_present ? var.condition : {}
}

data "aws_kms_key" "this" {
  key_id = "arn:aws:kms:us-east-1:<AccountID>:key/***"
}

data "aws_iam_role" "this" {
  name = "AWSServiceRoleForBackup"
}

resource "aws_backup_vault" "this" {
  name        = local.backup_vault_name
  kms_key_arn = data.aws_kms_key.this.arn
}

resource "time_sleep" "wait_10_seconds" {
  depends_on      = [aws_backup_vault.this]
  create_duration = "20s"
}

resource "aws_backup_plan" "this" {
  # Adding time sleep in order to prevent Racing Condition observed when it starts creating the Plan before the Vault is actually available.
  depends_on = [
    aws_backup_vault.this,
  time_sleep.wait_10_seconds]
  name = local.backup_plan_name
  dynamic "rule" {
    for_each = local.rules
    content {
      rule_name                = lookup(rule.value, "rule_name", null)
      target_vault_name        = lookup(rule.value, "target_vault_name", null) != null ? rule.value.target_vault_name : local.backup_vault_name
      schedule                 = lookup(rule.value, "schedule", null)
      start_window             = lookup(rule.value, "start_window", null)
      completion_window        = lookup(rule.value, "completion_window", null)
      enable_continuous_backup = lookup(rule.value, "enable_continuous_backup", null)
      recovery_point_tags      = length(lookup(rule.value, "recovery_point_tags", {})) == 0 ? var.tags : lookup(rule.value, "recovery_point_tags")

      # Lifecycle
      dynamic "lifecycle" {
        for_each = length(lookup(rule.value, "lifecycle", {})) == 0 ? [] : [lookup(rule.value, "lifecycle", {})]
        content {
          cold_storage_after = lookup(lifecycle.value, "cold_storage_after", 0)
          delete_after       = lookup(lifecycle.value, "delete_after", 90)
        }
      }

      dynamic "copy_action" {
        for_each = lookup(rule.value, "copy_actions", [])
        content {
          destination_vault_arn = lookup(copy_action.value, "destination_vault_arn", null)

          dynamic "lifecycle" {
            for_each = length(lookup(copy_action.value, "lifecycle", {})) == 0 ? [] : [lookup(copy_action.value, "lifecycle", {})]
            content {
              cold_storage_after = lookup(lifecycle.value, "cold_storage_after", 0)
              delete_after       = lookup(lifecycle.value, "delete_after", 120)
            }
          }
        }
      }
    }
  }

  # Advanced backup setting
  dynamic "advanced_backup_setting" {
    for_each = var.windows_vss_backup ? [1] : []
    content {
      backup_options = {
        WindowsVSS = "disabled"
      }
      resource_type = "EC2"
    }
  }
}

resource "aws_backup_selection" "this" {
  iam_role_arn = data.aws_iam_role.this.arn
  name         = var.selection_name
  plan_id      = aws_backup_plan.this.id

  resources     = var.resources
  not_resources = var.not_resources

  dynamic "selection_tag" {
    for_each = local.selection_tags #length(lookup(element(local.selections, count.index), "selection_tags", [])) == 0 ? [] : lookup(element(local.selections, count.index), "selection_tags", [])
    content {
      type  = lookup(selection_tag.value, "type", null)
      key   = lookup(selection_tag.value, "key", null)
      value = lookup(selection_tag.value, "value", null)
    }
  }

  dynamic "condition" {
    for_each = local.condition
    content {
      dynamic "string_equals" {
        for_each = lookup(condition.value, "string_equals", null) == null ? [] : [condition.value.string_equals]
        content {
          key   = lookup(string_equals.value, "key", null)
          value = lookup(string_equals.value, "value", null)
        }
      }
      dynamic "string_like" {
        for_each = lookup(condition.value, "string_like", null) == null ? [] : [condition.value.string_like]
        content {
          key   = lookup(string_like.value, "key", null)
          value = lookup(string_like.value, "value", null)
        }
      }
      dynamic "string_not_equals" {
        for_each = lookup(condition.value, "string_not_equals", null) == null ? [] : [condition.value.string_not_equals]
        content {
          key   = lookup(string_not_equals.value, "key", null)
          value = lookup(string_not_equals.value, "value", null)
        }
      }
      dynamic "string_not_like" {
        for_each = lookup(condition.value, "string_not_like", null) == null ? [] : [condition.value.string_not_like]
        content {
          key   = lookup(string_not_like.value, "key", null)
          value = lookup(string_not_like.value, "value", null)
        }
      }
    }
  }
}

resource "aws_backup_vault_lock_configuration" "test" {
  count               = var.enable_vault_lock ? 1 : 0
  backup_vault_name   = aws_backup_vault.this.name
  changeable_for_days = var.changeable_for_days
  max_retention_days  = var.max_retention_days
  min_retention_days  = var.min_retention_days
}
