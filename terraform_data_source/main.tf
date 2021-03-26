terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = var.region
}
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_1.id]
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = var.key_name
  tags = {
    Name = "${var.prefix} My_ec2"
  }
}
resource "aws_key_pair" "TerraformKey" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path)
}
resource "aws_security_group" "sg_1" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "ssh from internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "http from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.prefix} allow_ssh_http"
  }
}
output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}
output "arn" {
  value = aws_instance.web.arn
}
variable instance_tenancy {
    type = string
    default = "default"
    description = "A tenancy option for instances launched into the VPC"
}
variable key_name {
    type = string
    default = "my_macbook_key"
    description = "name of keypair"
}
variable ssh_key_path {
    type = string
    default =  "~/.ssh/id_rsa.pub"
    description = "path of ssh public key"
}
variable region {
    type = string
    default = "us-east-1"
    description = "Location of resources"
}
variable Security_Group_name {
    type = string
}
variable Security_Group_description {
    type = string
}
variable prefix {
    type = string
}
variable ami {
    type = string
    description = "Image of ec2"
    validation {
                condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
                error_message = "The ami value must be a valid AMI id, starting with ami-."
        }
}
variable instance_type {
    type = string
}