resource "aws_key_pair" "TerraformKey" {
  key_name   = "TerraformKey"
  public_key = file("~/.ssh/id_rsa.pub")
}