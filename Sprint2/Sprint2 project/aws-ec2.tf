data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = "${aws_security_group.project-sg.id}"
  iam_instance_profile   = aws_iam_instance_profile.ec2.name
  user_data = file("${path.module}/script.sh")
  key_name = aws_key_pair.key-tf.key_name
  tags = {
    Name = "S2Project"
  }
}
# provisioner "local-exec" {

#     connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("${path.module}/id_rsa")
#     host        = self.public_ip
# }