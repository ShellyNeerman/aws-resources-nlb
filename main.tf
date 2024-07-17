provider "aws" {
  region = var.region
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.9.0"

  name                     = var.alb_name
  internal                 = var.alb_internal
  security_groups          = var.security_groups
  subnets                  = var.subnets
  enable_deletion_protection = var.enable_deletion_protection
  tags                     = var.tags
}
