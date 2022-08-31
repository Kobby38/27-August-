terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}



#creating networking for project
resource "aws_vpc" "July-terraform" {
  cidr_block        = var.cidr-for-vpc
  instance_tenancy  = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "July-terraform"
  }
}

#public subnet
resource "aws_subnet" "pub-sub-1" {
  vpc_id     = aws_vpc.July-terraform.id
  cidr_block = var.cidr-for-public
  availability_zone = var.AZ-1

  tags = {
    Name = "pub-sub-1"
  }
}

#private subnet
resource "aws_subnet" "priv-sub-1" {
  vpc_id     = aws_vpc.July-terraform.id
  cidr_block = var.cidr-for-private
  availability_zone = var.AZ-1
  tags = {
    Name = "priv-sub-1"
  }
}



