terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_server" {
  ami = "ami-097855b862d5b1eb2"
  instance_type = "t2.micro"
  key_name      = "vockey"

  tags = {
    Name = "DevOps-Lab-Server"
  }
}

output "instance_public_ip" {
  value = aws_instance.devops_server.public_ip
}