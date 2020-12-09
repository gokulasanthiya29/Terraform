provider "aws"{
    region = "us-east-1"
    access_key = "<access_key>"
    secret_key = "<secret_key>"
}

resource "aws_vpc" "tf-project-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tf-project"
  }
}

resource "aws_internet_gateway" "tf-project-igw" {
  vpc_id = aws_vpc.tf-project-vpc.id

  tags = {
    Name = "tf-project"
  }
}

resource "aws_route_table" "tf-project-rt" {
  vpc_id = aws_vpc.tf-project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-project-igw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.tf-project-igw.id
  }

  tags = {
    Name = "tf-project"
  }
}

#variable = "tf-project-subnet-using-var" {
#  decription = "subnet creation"
#  default = 10.0.1.50/24
#}
#variable = "tf-project-subnet-using-var" {
#  description = "subnet creation"
#} -> while explicitly defining the cidr_block using variables in 'terraform.tfvars' file

resource "aws_subnet" "tf-project-subnet" {
  vpc_id     = aws_vpc.tf-project-vpc.id
  cidr_block = "10.0.1.0/24" #cidr_block = var.tf-project-subnet-using-var -> while creating subnet using variables
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-project"
  }
}

resource "aws_route_table_association" "tf-project-rt-association" {
  subnet_id      = aws_subnet.tf-project-subnet.id
  route_table_id = aws_route_table.tf-project-rt.id
}

resource "aws_security_group" "tf-project-sg" {
  name        = "allow_web_traffic"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.tf-project-vpc.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
  ingress {
    description = "SSH"
    from_part = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
      
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-project"
  }
}

resource "aws_network_interface" "tf-project-nic" {
  subnet_id       = aws_subnet.tf-project-subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.tf-project-sg.id]
}

resource "aws_eip" "tf-project-eip" {
  vpc                       = true
  network_interface         = aws_network_interface.tf-project-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_vpc.tf-project-vpc]
}

resource "aws_instance" "tf-project-web-server" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t3.micro"
  availability_zone = "us-east-1a"
  key_name = "tf-key-pair"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.tf-project-nic.id
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl apache2
              sudo bash -c 'TERRAFORM-PROJECT-> WEB SERVER > /var/www/html/index.html'
              EOF

  tags = {
    Name = "tf-project-web-server"
  }
}

#for automatic view of configured resources ID
output "vpc-id" {
  value = "aws_vpc.tf-project-vpc.id"
}

    
