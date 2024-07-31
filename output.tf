output "nlb_dns_name_output" {
  value = aws_lb.nlb.dns_name
}

output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
