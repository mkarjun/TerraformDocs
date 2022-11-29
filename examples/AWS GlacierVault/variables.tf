
variable "enable_vault_lock" {
  description = "Enable vault lock"
  type        = bool
  default     = false
}

variable complete_lock {
  type        = bool
  description = "A boolean value that when set to true, specifies that the vault lock policy is in place."
  default     = false
}

variable additional_tags {
  description = "Mention additional tags if any."
  type = map
  default = {}
}
variable function {
  description = "Function/scope of the Glacier Vault. This value will be used to form the Name tag. Example: GLR-<function>-001"
  validation {
    condition = can(regex("^[a-zA-Z0-9-]+$", var.function)) 
    error_message = "Function should contain only alphanumeric characters and hyphen."
  }
}

variable increment_code {
  description = "Increment code to append to the Vault name. Example: GLR-Automation-<increment_code>"
  validation {
    condition = can(regex("^\\d{3}$", var.increment_code))
    error_message = "Increment code must be a three digit number."
  }
}
variable description {
  description = "Provide a description for the Glacier Vault. This entry will be populated in Description tag for the Glacier vault at creation time"
}

variable sns_topic_arn {
   description = "Provide SNS topic ARN to send Glacier Vault related notifications."
   type = string
   default = ""
}

variable access_policy_json_file_path {
  description = "File path of the policy document. This is a JSON formatted string."
  default = null
}
