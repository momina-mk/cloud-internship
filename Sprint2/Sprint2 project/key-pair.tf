resource "aws_key_pair" "key-tf" {
  key_name   = "project-key"
  public_key = file("${path.module}/project-key.pub")
}