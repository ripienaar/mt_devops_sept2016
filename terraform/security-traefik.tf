resource "aws_security_group" "traefik" {
  vpc_id = "${aws_vpc.mt_devops_default.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_groups = ["${aws_security_group.front_elb.id}"]
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

