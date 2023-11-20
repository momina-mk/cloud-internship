resource "aws_volume_attachment" "ec2-instance" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2-instance.id
  
  
}