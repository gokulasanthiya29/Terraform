provider "aws"{
    region="us-east-1"
    access_key = "<access_key>"
    secret_key = "<secret_key>"
}

resource "aws_instance" "terraform-provisioned-EC2" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"

  tags = {
    Name = "Hi! I'm the EC2 instance provisioned by Terraform."
  }
}
