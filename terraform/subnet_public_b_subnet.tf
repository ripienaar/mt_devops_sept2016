resource "aws_subnet" "public_b_subnet" {
  vpc_id            = "${aws_vpc.mt_devops_default.id}"
  cidr_block        = "${var.public_subnet_b_cidr}"
  availability_zone = "${var.avail_zone_b}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.public_gateway"]
  tags {
    Project = "mt_devops"
  }
}

resource "aws_route_table_association" "b_default" {
  subnet_id = "${aws_subnet.public_b_subnet.id}"
  route_table_id = "${aws_route_table.default.id}"
}
