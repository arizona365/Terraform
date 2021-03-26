resource "aws_route_table_association" "RTassociation" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.RouteTable.id
}