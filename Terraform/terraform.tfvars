application-region = "us-east-1"

vpc-cidr = "10.0.0.0/16"

public-subnets = [
  {
    name = "public-subnet-1"
    cidr = "10.0.1.0/24"
    zone = "us-east-1a"
    }, {
    name = "public-subnet-2"
    cidr = "10.0.2.0/24"
    zone = "us-east-1b"
  }
]

private-subnets = [
  {
    name = "private-subnet-1"
    cidr = "10.0.3.0/24"
    zone = "us-east-1a"
    }, {
    name = "private-subnet-2"
    cidr = "10.0.4.0/24"
    zone = "us-east-1b"
  }
]

nat-gw-subnet-name = "public-subnet-1"

instances-ami-id = "ami-0a7d80731ae1b2435"
