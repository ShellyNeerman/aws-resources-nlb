variable "region" {
  description = "The AWS region to deploy the ALB"
  type        = string
  default     = "us-east-2"  
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "my-alb"
}

variable "alb_internal" {
  description = "Whether the load balancer is internal or external"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the load balancer"
  type        = list(string)
  default     = // somehow need to reference sofia's sg id
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the load balancer"
  type        = list(string)
  default     = // same as above
}

variable "enable_deletion_protection" {
  description = "Whether deletion protection is enabled"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "my-project"
  }
}
