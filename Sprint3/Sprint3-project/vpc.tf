module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  cidr   = "172.20.112.0/24"
   azs   = ["us-east-1a"]
}
resource "aws_internet_gateway" "s3_gw" {
  vpc_id = module.vpc.default_vpc_id
}

# route table for public subnet - connecting to Internet gateway
# resource "aws_route_table" "s3_rt" {
#   vpc_id = module.vpc.default_vpc_id
#   route {
#     cidr_block = "172.20.112.0/24"
#     gateway_id ="aws_internet_gateway.s3_gw"
#   }
# }