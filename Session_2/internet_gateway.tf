resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.prefix} my_ig"
    Department = "Production"
    Created_by = "Devops"
  }
}