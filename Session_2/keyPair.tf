resource "aws_key_pair" "TerraformKey" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path)
}