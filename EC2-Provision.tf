provider "aws"{
    region="us-east-1"
    access_key = "AKIAIPGAZ6V57PYNNYTA"
    secret_key = "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"
}

resource "aws_instance" "terraform-provisioned-EC2" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"

  tags = {
    Name = "Hi! I'm the EC2 instance provisioned by Terraform."
  }
}