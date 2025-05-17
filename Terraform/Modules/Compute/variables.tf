variable "application-vpc-id" {
  type = string
}

variable "public-subnets-ids" {
  type = list(string)
}

variable "private-subnets-ids" {
  type = list(string)
}

variable "load-balancer-security-group-id" {
  type = string
}

variable "bastion-server-security-group-id" {
  type = string
}

variable "application-server-security-group-id" {
  type = string
}

variable "instances-ami-id" {
  type = string
}
