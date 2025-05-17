output "bastion-server-public-ip" {
  value = aws_instance.bastion-server.public_ip
}

output "application-server-private-ip" {
  value = aws_instance.application-server.private_ip
}

output "load-balancer-dns" {
  value = aws_lb.application-load-balancer.dns_name
}
