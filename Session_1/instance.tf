resource "aws_instance" "web" {
  ami             = "ami-038f1ca1bd58a5790"
  instance_type   = "t3.micro"
  vpc_security_group_ids = [aws_security_group.SG.id]
  subnet_id       = aws_subnet.public_subnet_1.id
  key_name        = "TerraformKey"
  
  
  tags = {
    Name = "My_Ec2"
  }
}