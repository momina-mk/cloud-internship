resource "aws_vpc" "this" {
    cidr_block = "10.1.1.0/24"
}
resource "aws_internet_gateway" "mygateway" {
  vpc_id = aws_vpc.this.id
}
resource "aws_subnet" "public" {
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  vpc_id = aws_vpc.this.id
}