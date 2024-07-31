variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}

variable "nlb_name" {
  description = "The name of the NLB"
  default = "my-nlb"
}

variable "nlb_internal" {
  description = "Whether the NLB is internal"
  default     = false
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection for the NLB"
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
