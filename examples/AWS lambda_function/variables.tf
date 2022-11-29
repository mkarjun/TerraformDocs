variable "function" {
  description = "Function/scope of the module. This value will be used to form the Name tag. Example: EC2-<function>-001"
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.function))
    error_message = "Function should contain only alphanumeric characters and dash."
  }
}

variable "increment_code" {
  description = "Increment code to append to the name. Example: WebProxy-<increment_code>"
  validation {
    condition     = can(regex("^\\d{3}$", var.increment_code))
    error_message = "Increment code must be a three digit number."
  }
}

variable "file_name" {
  type        = string
  description = "Source file name"

}
variable "role_arn" {
  type        = string
  description = "Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources."
}

variable "handle_file_name" {
  type        = string
  description = "entry point file name with extention"
  default     = null
}

variable "runtime" {
  type = string
  validation {
    condition     = contains(["nodejs12.x", "nodejs14.x", "nodejs16.x", "python2.7", "python3.6", "python3.7", "python3.8", "python3.9", "nodejs4.3 - edge"], var.runtime)
    error_message = "Value should one of the following : nodejs12.x ,  nodejs14.x ,  nodejs16.x ,  python2.7 ,  python3.6 ,  python3.7 ,  python3.8 ,  python3.9 ,  nodejs4.3-edge."
  }
}

variable "storage" {
  type        = number
  description = "Storage to be added to lambda function "
  default     = 512
}

variable "architectures" {
  type        = list(string)
  description = "Instruction set architecture for your Lambda function. "
  default     = ["x86_64"]
}

variable "code_signing_config_arn" {
  type        = string
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. "
  default     = null
}

variable "dead_letter_config" {
  type = list(object({
    target_arn = string
  }))
  description = "Specifies the queue or topic where Lambda sends asynchronous events when they fail processing. "
  default     = []
}

variable "environment" {
  type        = map(string)
  description = "Environment variables that are accessible from the function code during execution."
  default     = {}
}


variable "kms_key_arn" {
  type        = string
  default     = null
  description = "Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables."
}

variable "timeout" {
  type        = number
  default     = 3
  description = "Amount of time your Lambda Function has to run in seconds."
}

variable "memory_size" {
  type        = number
  default     = 128
  description = "Amount of memory in MB your Lambda Function can use at runtime."
}

variable "publish" {
  type        = bool
  default     = false
  description = "Whether to publish creation/change as new Lambda Function Version."
}

variable "reserved_concurrent_executions" {
  type        = number
  default     = -1
  description = "Amount of reserved concurrent executions for this lambda function."

}

variable "layers" {
  type        = list(string)
  default     = []
  #nullable    = true
  description = "list of layer ARNs"

}

variable "efs_config" {
  type = object({
    arn              = string
    local_mount_path = string
  })
  description = "Connection settings for an EFS file system. "
  default     = null
}

variable "vpc_config" {
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
  #nullable = true
  default = {
    security_group_ids = []
    subnet_ids         = []
  }
  description = "VPC subnet information."
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