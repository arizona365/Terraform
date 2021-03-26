output "endpoint" {
    value = aws_db_instance._.address
}
output "ip_address" {
    value = aws_instance.web.public_ip
}