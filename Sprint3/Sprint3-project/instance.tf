data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module "ec2-instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  name                   = "S3-instance"
  ami                    = data.aws_ami.ubuntu.id
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}
resource "aws_key_pair" "this" {
  key_name   = "s3key"
  public_key = file("s3key.pub")
}
