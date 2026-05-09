resource "aws_vpc" "this" {
  cidr_block       = "192.168.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "subnet_az1" {
  for_each          = { "0" : "192.168.0.0/27", "1" : "192.168.0.32/27", "2" : "192.168.0.64/27" }
  vpc_id            = aws_vpc.this.id
  availability_zone = "us-east-1a"
  cidr_block        = each.value

  tags = {
    Name = "publicsubnet-${each.key}"
  }
}

resource "aws_subnet" "main" {
  for_each          = { "0" : "192.168.0.96/27", "1" : "192.168.0.128/27", "2" : "192.168.0.160/27" }
  vpc_id            = aws_vpc.this.id
  availability_zone = "us-east-1b"
  cidr_block        = each.value

  tags = {
    Name = "privatesubnet-${each.key}"
  }
}



variable "cidr_block" {
  type    = list(string)
  default = ["192.168.0.0/27", "192.168.0.32/27", "192.168.0.64/27", "192.168.0.96/27", "192.168.0.128/27", "192.168.0.160/27"]


}




