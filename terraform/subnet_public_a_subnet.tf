resource "aws_subnet" "public_a_subnet" {
  vpc_id            = "${aws_vpc.mt_devops_default.id}"
  cidr_block        = "${var.public_subnet_a_cidr}"
  availability_zone = "${var.avail_zone_a}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.public_gateway"]
  tags {
    Project = "mt_devops"
  }
}

resource "aws_route_table_association" "a_default" {
  subnet_id = "${aws_subnet.public_a_subnet.id}"
  route_table_id = "${aws_route_table.default.id}"
}
