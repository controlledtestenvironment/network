output "subnet_id" {
  value = aws_subnet.sub_vpc.id
}

output "security_group_id" {
  value = aws_security_group.security.id
}