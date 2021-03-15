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