resource "aws_eip" "application-nat-gw-ip" {
  tags = { Name = "application-nat-gw-ip" }
}

resource "aws_nat_gateway" "application-nat-gw" {
  allocation_id = aws_eip.application-nat-gw-ip.id
  subnet_id     = aws_subnet.public-subnets["${var.nat-gw-subnet-name}"].id

  tags = {
    Name = "application-nat-gw"
  }

  depends_on = [aws_internet_gateway.application-igw]
}
