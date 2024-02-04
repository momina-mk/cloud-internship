resource "aws_key_pair" "my_aws_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("my-key-pair.pub")
  tags = {
    Name = "MyKeyPair"
  }
}