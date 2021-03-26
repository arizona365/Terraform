provider "aws" {
  region = var.region
}

module "myapp-vpc" {
    source = "github.com/sprintqaDevOps/web-server.git" 
    #source = "./vpc"

    cidr_block_vpc    = var.cidr_block_vpc
    prefix            = var.prefix
    cidr_block_subnet = var.cidr_block_subnet
    cidr_block_route  = var.cidr_block_route
}

module "myapp-webserver" {
    #source = "./web-server"
    source = "github.com/sprintqaDevOps/web-server.git" 

    key_name            = var.key_name
    ssh_key_path        = var.ssh_key_path
    ami                 = var.ami
    instance_type       = var.instance_type
    subnet_id           = module.myapp-vpc.subnet.id
    vpc_id              = module.myapp-vpc.my_vpc.id
    prefix              = var.prefix
    security_group_name = var.security_group_name
    
}