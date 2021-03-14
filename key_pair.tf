resource "aws_key_pair" "myTerraformKey" {
  key_name   = "myTerraformKey"
  public_key = file("~/.ssh/id_rsa.pub")
}