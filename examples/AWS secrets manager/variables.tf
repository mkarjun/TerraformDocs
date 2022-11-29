variable "enable_rotation" {
  description = "Enable rotation of secrets"
  type        = bool
  default     = false
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = null
}

variable "statement_id" {
  description = "ARN of the Lambda function"
  type        = string
  default     = null
}

variable "action" {
  description = "Action to allow"
  type        = string
  default     = null
}

variable "principal" {
  description = "Principal to allow"
  type        = string
  default     = null
}


variable "recovery_window_in_days" {
  description = "Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days."
  type        = number
  default     = 30
}

variable "description" {
  type        = string
  description = "Description of the lambda. same will be used for the tag: Description"
}

variable "additional_tags" {
  description = "Mention additional tags if any."
  type        = map(any)
  default     = {}
}

variable "increment_code" {
  description = "Increment code to append to the name. Example: WANV-SHS-9-EC2-WebProxy-<increment_code>"
  validation {
    condition     = can(regex("^\\d{3}$", var.increment_code))
    error_message = "Increment code must be a three digit number."
  }
}


# Secrets
variable "rotate_secrets" {
  description = "Map of secrets to keep and rotate in AWS Secrets Manager"
  type        = any
  default     = {}
}

# Secrets
variable "secrets" {
  description = "Map of secrets to keep in AWS Secrets Manager"
  type        = any
  default     = {}
}

variable "unmanaged" {
  description = "Terraform must ignore secrets lifecycle. Using this option you can initialize the secrets and rotate them outside Terraform, thus, avoiding other users to change or rotate the secrets by subsequent runs of Terraform"
  type        = bool
  default     = false
}

variable "automatically_after_days" {
  description = "Specifies the number of days between automatic scheduled rotations of the secret."
  type        = number
  default     = 30
}

# Tags
variable "tags" {
  description = "Specifies a key-value map of user-defined tags that are attached to the secret."
  type        = any
  default     = {}
}