resource "aws_vpc" "mt_devops_default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "mt_devops"
  }
}
