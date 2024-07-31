provider "aws" {
  region = var.region
}

# Retrieve VPC
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Retrieve subnets
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Retrieve security group
# Fetch the default security group for the VPC
data "aws_security_group" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

resource "aws_lb" "nlb" {
  name               = var.nlb_name
  internal           = var.nlb_internal
  load_balancer_type = "network"
  security_groups    = [data.aws_security_group.default.id]
  subnets            = data.aws_subnets.selected.ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = var.tags
}

resource "aws_lb_target_group" "nlb_tg" {
  name     = "nlb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = data.aws_vpc.selected.id

  health_check {
    interval            = 30
    protocol            = "TCP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  tags = var.tags
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

output "nlb_arn" {
  value = aws_lb.nlb.arn
}

output "nlb_dns_name" {
  value = aws_lb.nlb.dns_name
}
