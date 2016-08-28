resource "aws_route_table" "default" {
  vpc_id = "${aws_vpc.mt_devops_default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.public_gateway.id}"
  }
  tags {
    Project = "mt_devops"
  }
}
