output "application-vpc-id" {
  value = aws_vpc.application-vpc.id
}

output "public-subnets-ids" {
  value = [for subnet in aws_subnet.public-subnets : subnet.id]
}

output "private-subnets-ids" {
  value = [for subnet in aws_subnet.private-subnets : subnet.id]
}

output "load-balancer-security-group-id" {
  value = aws_security_group.load-balancer-security-group.id
}

output "bastion-server-security-group-id" {
  value = aws_security_group.bastion-server-security-group.id
}

output "application-server-security-group-id" {
  value = aws_security_group.application-server-security-group.id
}
