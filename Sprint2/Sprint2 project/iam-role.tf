resource "aws_iam_role_policy" "S3_policy" {
  name = "S3_policy"
  role = aws_iam_role.S3_role.id
  policy = "${file("iam-role-policy.json")}"
}

resource "aws_iam_role" "S3_role" {
  name = "S3_role"
  assume_role_policy = "${file("iam-role.json")}"
}
# resource "aws_iam_role_policy_attachment" "ec2_role_attachment" {
#  policy_arn = aws_iam_policy.ec2.arn
#   role       = aws_iam_role.ec2.name
# }
resource "aws_iam_instance_profile" "ec2" {
  name = "EC2"
  role = aws_iam_role.S3_role.name
}