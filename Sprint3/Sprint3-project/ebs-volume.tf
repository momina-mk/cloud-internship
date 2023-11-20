resource "aws_ebs_volume" "this" {
  availability_zone = module.ec2-instance.availability_zone
  size              = 2

  tags = {
    Name = "Sprint3 storage"
  }
}
