resource "aws_internet_gateway" "public_gateway" {
  vpc_id = "${aws_vpc.mt_devops_default.id}"

  tags {
    Project = "mt_devops"
  }
}
