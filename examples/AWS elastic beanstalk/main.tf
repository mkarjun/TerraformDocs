locals {

  is_setting_present = var.setting == null ? false : true
  setting            = local.is_setting_present ? var.setting : []

  is_appversion_lifecycle_present = var.appversion_lifecycle == null ? false : true
  appversion_lifecycle            = local.is_appversion_lifecycle_present ? var.appversion_lifecycle : []

  name = "eb_app-${var.function}-${var.increment_code}"


}

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = local.name
  description = var.app_description
  dynamic "appversion_lifecycle" {
    for_each = local.appversion_lifecycle
    content {
      service_role = appversion_lifecycle.value.service_role
      max_age_in_days = lookup(appversion_lifecycle.value, "max_age_in_days", null) == null && lookup(appversion_lifecycle.value, "max_count", null) == null  ?  appversion_lifecycle.value.max_age_in_days : null
      max_count = lookup(appversion_lifecycle.value, "max_count", null) == null && lookup(appversion_lifecycle.value, "max_age_in_days", null) == null  ?  appversion_lifecycle.value.max_count : null
      delete_source_from_s3 = lookup(appversion_lifecycle.value, "delete_source_from_s3", null)
    }
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on      = [aws_elastic_beanstalk_application.tftest]
  create_duration = "30s"
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  depends_on = [
    time_sleep.wait_30_seconds
  ]
  name                   = var.function1
  application            = aws_elastic_beanstalk_application.tftest.name
  solution_stack_name    = var.solution_stack_name
  cname_prefix           = var.cname_prefix
  description            = var.description
  tier                   = var.tier
  template_name          = var.template_name
  platform_arn           = var.platform_arn
  wait_for_ready_timeout = var.wait_for_ready_timeout
  poll_interval          = var.poll_interval
  version_label          = var.version_label
  dynamic "setting" {
    for_each = local.setting
    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }
}