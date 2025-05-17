resource "aws_internet_gateway" "application-igw" {
  vpc_id = aws_vpc.application-vpc.id
  tags   = { Name = "application-igw" }
}
