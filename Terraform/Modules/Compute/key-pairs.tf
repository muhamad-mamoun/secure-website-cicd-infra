resource "tls_private_key" "ssh-key-pairs" {
  algorithm = "ED25519"
}

resource "local_file" "ssh-private-key" {
  content         = tls_private_key.ssh-key-pairs.private_key_openssh
  filename        = "ssh-private-key"
  file_permission = "0600"
}

resource "local_file" "ssh-public-key" {
  content         = tls_private_key.ssh-key-pairs.public_key_openssh
  filename        = "ssh-private-key.pub"
  file_permission = "0600"
}

resource "aws_key_pair" "ssh-public-key" {
  key_name   = "ssh-public-key"
  public_key = tls_private_key.ssh-key-pairs.public_key_openssh
}
