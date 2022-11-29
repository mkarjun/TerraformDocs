variable "cname_prefix" {
  type        = string
  default     = null
  description = "CNAME prefix"
}

variable "description" {
  type        = string
  default     = null
  description = "Environment description"
}

variable "tier" {
  type        = string
  default     = "WebServer"
  description = "Environment tier"
}

variable "template_name" {
  type        = string
  default     = null
  description = "Environment template name"
}

variable "platform_arn" {
  type        = string
  default     = null
  description = "Environment platform ARN"
}

variable "wait_for_ready_timeout" {
  type        = string
  default     = "20m"
  description = "Environment wait for ready timeout"
}

variable "poll_interval" {
  type        = string
  default     = "11s"
  description = "Environment poll interval"
}

variable "version_label" {
  type        = string
  default     = null
  description = "Environment version label"
}

variable "setting" {
  type        = any
  default     = []
  description = "Environment setting"
}

variable "app_description" {
  type        = string
  default     = null
  description = "Application description"
}

variable "appversion_lifecycle" {
  type        = any
  default     = null
  description = "Application version lifecycle"
}

variable function {
    description = "Function/scope of the instance. This value will be used to form the Name tag. Example: WANV-SHS-9-EC2-<function>-001"
  validation {
    condition = can(regex("^[a-zA-Z0-9-]+$", var.function)) 
    error_message = "Function should contain only alphanumeric characters and dash."
  }
}

variable increment_code {
  description = "Increment code to append to the instance name. Example: WANV-SHS-9-EC2-WebProxy-<increment_code>"
  validation {
    condition = can(regex("^\\d{3}$", var.increment_code)) 
    error_message = "Increment code must be a three digit number."
  }
}

variable additional_tags {
 description = "Mention additional tags if any."
  type = map
  default = {}
}

variable "function1" {
  description = "Function/scope of the instance. This value will be used to form the Name tag. Example: WANV-SHS-9-EC2-<function>-001"
  validation {
    condition = can(regex("^[a-zA-Z0-9-]+$", var.function1)) 
    error_message = "Function should contain only alphanumeric characters and dash."
  }  
}

variable "solution_stack_name" {
  description = "Solution stack name."
  validation {
    condition = can(regex("^[a-zA-Z0-9-\\.\\s]+$", var.solution_stack_name)) 
    error_message = "Solution stack name should contain only alphanumeric characters, dash, dot and space."
  }
}