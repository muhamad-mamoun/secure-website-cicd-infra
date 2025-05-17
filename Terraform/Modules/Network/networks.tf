resource "aws_vpc" "application-vpc" {
  cidr_block = var.vpc-cidr
  tags       = { Name = "application-vpc" }
}
