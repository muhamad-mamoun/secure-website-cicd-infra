resource "aws_instance" "bastion-server" {
  ami                         = var.instances-ami-id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-public-key.key_name
  vpc_security_group_ids      = [var.bastion-server-security-group-id]
  subnet_id                   = var.public-subnets-ids[0]

  tags = { Name = "bastion-server" }
}

resource "aws_instance" "application-server" {
  ami                         = var.instances-ami-id
  instance_type               = "t3.micro"
  associate_public_ip_address = false
  key_name                    = aws_key_pair.ssh-public-key.key_name
  vpc_security_group_ids      = [var.application-server-security-group-id]
  subnet_id                   = var.private-subnets-ids[0]

  tags = { Name = "application-server" }
}
