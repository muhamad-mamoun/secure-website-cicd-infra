resource "aws_subnet" "public-subnets" {
  for_each          = { for subnet in var.public-subnets : subnet.name => subnet }
  vpc_id            = aws_vpc.application-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.zone

  tags = {
    Name = each.value.name
  }
}

resource "aws_subnet" "private-subnets" {
  for_each          = { for subnet in var.private-subnets : subnet.name => subnet }
  vpc_id            = aws_vpc.application-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.zone

  tags = {
    Name = each.value.name
  }
}
