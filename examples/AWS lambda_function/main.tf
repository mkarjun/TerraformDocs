locals {
  name = "LMB-${var.function}-${var.increment_code}"
  environment = length(var.environment) > 0 ? {
    variables = var.environment
  } : {}
  is_efs_present = var.efs_config == null ? false : true
  efs_config     = local.is_efs_present ? [var.efs_config] : []
}

resource "aws_lambda_function" "main" {
  function_name                  = local.name
  description                    = var.description
  filename                       = var.file_name
  role                           = var.role_arn
  handler                        = var.handle_file_name
  runtime                        = var.runtime
  architectures                  = var.architectures
  code_signing_config_arn        = var.code_signing_config_arn
  kms_key_arn                    = var.kms_key_arn
  timeout                        = var.timeout
  memory_size                    = var.memory_size
  publish                        = var.publish
  reserved_concurrent_executions = var.reserved_concurrent_executions
  layers                         = var.layers
  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config
    content {
      target_arn = dead_letter_config.value.target_arn
    }
  }
  dynamic "environment" {
    for_each = local.environment
    content {
      variables = environment.value
    }
  }
  dynamic "file_system_config" {
    for_each = local.efs_config
    content {
      local_mount_path = file_system_config.value.local_mount_path
      arn              = file_system_config.value.arn
    }
  }
  dynamic "vpc_config" {
    for_each = [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }
  ephemeral_storage {
    size = var.storage
  }
}