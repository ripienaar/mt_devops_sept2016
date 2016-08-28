resource "aws_security_group" "management" {
  vpc_id = "${aws_vpc.mt_devops_default.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["80.85.84.108/32", "139.162.163.118/32"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["80.85.84.108/32", "139.162.163.118/32"]
  }

  tags {
    Project = "mt_devops"
  }
}
