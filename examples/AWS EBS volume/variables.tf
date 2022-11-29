variable "ebs_volumes" {
  description = "Configuration details of EBS volumes to be created."
  type        = map(any)
  default     = {}
}

variable "final_snapshot" {
  description = "Whether or not to create a final snapshot when the volume is destroyed."
  type        = bool
  default     = false
}

variable "outpost_arn" {
  description = "The Amazon Resource Name (ARN) of the Outpost."
  type        = string
  default     = null
}

variable "throughput" {
  description = "The throughput to provision for a gp3 volume, with a maximum of 1,000 MiB/s."
  type        = number
  default     = null
}

variable "additional_tags" {
  description = "Mention additional tags if any."
  type        = map(any)
  default     = {}
}

variable "aws_region" {
  description = "AWS region to be used."
  type        = string
  default     = "us-east-1"
}
