provider "aws"{
    region = "us-east-1"
    access_key = "AKIAJ5GWJT3PIPZSPGAQ"
    secret_key = "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"
}
resource "aws_vpc" "tf-provisioned-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "TERRAFORM-VPC"
  }
}

resource "aws_subnet" "terraform-created-subnet1" {
  vpc_id     = aws_vpc.tf-provisioned-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TERRAFORM-SUBNET1"
  }
}