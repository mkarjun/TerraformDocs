variable "additional_tags" {
  description = "Mention additional tags if any."
  type        = map(any)
  default     = {}
}

variable "function" {
  description = "Function/scope of the SNS topic. This value will be used to form the Name tag. Example: WANV-SHS-9-CWR-<function>-001"
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.function))
    error_message = "Function should contain only alphanumeric characters and dash."
  }
}

variable "increment_code" {
  description = "Increment code to append to the instance name. Example: WANV-SHS-9-CWR-Automation-<increment_code>"
  validation {
    condition     = can(regex("^\\d{4}$", var.increment_code))
    error_message = "Increment code must be a four digit number."
  }
}

variable "description" {
  description = "Description of the CloudWatch EventBridge rule."
}

variable "is_enabled" {
  description = "Whether the rule should be enabled."
  type        = bool
  default     = true
}

variable "schedule_expression" {
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus."
  default     = null
}

variable "role_arn" {
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  default     = null
}

variable "event_pattern" {
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required."
  default     = null
}

variable "eventbridge_targets" {
  description = "A map of objects with EventBridge target."
  type        = any
}
