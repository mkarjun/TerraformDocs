variable "rule_schedule" {
  description = "A CRON expression specifying when AWS Backup initiates a backup job"
  type        = string
  default     = null
}

variable "rule_info" {
  description = "The name of a rule."
  type        = string
  default     = null
}

variable "rule_start_window" {
  description = "The amount of time in minutes before beginning a backup"
  type        = number
  default     = null
}

variable "rule_completion_window" {
  description = "The amount of time AWS Backup attempts a backup before canceling the job and returning an error"
  type        = number
  default     = null
}

variable "rule_recovery_point_tags" {
  description = "Metadata that you can assign to help organize the resources that you create"
  type        = map(string)
  default     = {}
}

variable "rule" {
  description = "A list of selction maps"
  type        = any
  default     = []
}

variable "selections" {
  description = "A list of selction maps"
  type        = any
  default     = []
}

variable "selection_name" {
  type    = string
  default = null
}

variable "rule_lifecycle_cold_storage_after" {
  description = "Specifies the number of days after creation that a recovery point is moved to cold storage"
  type        = number
  default     = null
}

variable "rule_lifecycle_delete_after" {
  description = "Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than `cold_storage_after`"
  type        = number
  default     = null
}

variable "rule_enable_continuous_backup" {
  description = " Enable continuous backups for supported resources."
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  default     = 1
  type        = number
  description = "The days to retain backups for. Must be between 0 and 35."
}

variable "copy_tags_to_snapshot" {
  default     = true
  type        = bool
  description = "Copy all instance tags to the snapshots"
}

variable "policy_scope" {
  type        = string
  description = "Select policy scope for backup vault"
  validation {
    condition     = contains(["STD", "TIER1", "TIER2", "TIER3", "MRSTD", "RDSMRSTD"], var.policy_scope)
    error_message = "Incorrect value! Allowed values: STD, TIER1, TIER2, TIER3, MRSTD, RDSMRSTD ."
  }
}

variable "expiry" {
  type        = string
  description = "Select Expiry TimeFrame for backup retantion"
  validation {
    condition     = contains(["1YR", "3YR", "5YR", "7YR"], var.expiry)
    error_message = "Incorrect value! Allowed values: 1YR, 3YR, 5YR, 7YR ."
  }
}

variable "incremental_number" {
  default     = "001"
  type        = string
  description = "Incremental number for the naming of the BackupPlan and BackupVault"
}

variable "name" {
  description = "The name of the backup plan"
  type        = string
  default     = null
}

variable "resources" {
  description = "A list of resources to backup"
  type        = any
  default     = null
}

variable "not_resources" {
  description = "A list of resources to exclude from backup"
  type        = any
  default     = null
}

variable "selection_tags" {
  description = "List of tags for `selection_name` var, when using variable definition."
  type        = any
  default     = null
}

variable "condition" {
  description = "A list of conditions to backup"
  default     = null
}

variable "vault_name" {
  default = null
  type    = string
}

variable "rule_name" {
  default = null
  type    = string
}

variable "rules" {
  description = "A list of rule maps"
  type        = any
  default     = []
}

variable "windows_vss_backup" {
  description = "Enable Windows VSS backup option and create a VSS Windows backup"
  type        = bool
  default     = false
}

variable "selection_resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan"
  type        = list(any)
  default     = []
}

variable "selection_not_resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan."
  type        = list(any)
  default     = []
}

variable "selection_conditions" {
  description = "A map of conditions that you define to assign resources to your backup plans using tags."
  type        = map(any)
  default     = {}
}

variable "selection_enabled" {
  description = "Change to false to avoid deploying any AWS Backup resources"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "enable_vault_lock" {
  description = "Enable vault lock"
  type        = bool
  default     = false
}

variable "changeable_for_days" {
  description = "The number of days after creation that a recovery point can be restored."
  type        = number
  default     = 3
}

variable "max_retention_days" {
  description = "The maximum number of days that a recovery point is retained."
  type        = number
  default     = 2
}

variable "min_retention_days" {
  description = "The minimum number of days that a recovery point is retained."
  type        = number
  default     = 1
}

variable "target_vault_name" {
  description = "Function/scope of the loadbalancer."
  default     = "VAULT"
  validation {
    condition     = can(regex("^[A-Z0-9-]+$", var.target_vault_name))
    error_message = "Function should contain only alphanumeric characters and dash."
  }
}

variable "target_plan_name" {
  description = "Function/scope of the loadbalancer."
  default     = "BKPPLN"
  validation {
    condition     = can(regex("^[A-Z0-9-]+$", var.target_plan_name))
    error_message = "Function should contain only alphanumeric characters and dash."
  }
}

variable "common_tags" {
  description = "Mention mandatory tags if any."
  type        = map(any)
  default     = {}
}

variable "additional_tags" {
  description = "Mention additional tags if any."
  type        = map(any)
  default     = {}
}

variable "increment_code" {
  description = "Increment code to append to the resources."
  validation {
    condition     = can(regex("^\\d{3}$", var.increment_code))
    error_message = "Increment code must be a three digit number."
  }
}
