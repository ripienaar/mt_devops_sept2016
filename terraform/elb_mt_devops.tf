resource "aws_elb" "mt_devops" {
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "TCP:80"
    interval = 30
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  instances = ["${aws_instance.a_traefik.*.id}", "${aws_instance.b_traefik.*.id}"]
  subnets = ["${aws_subnet.public_a_subnet.id}", "${aws_subnet.public_b_subnet.id}"]
  security_groups = ["${aws_security_group.front_elb.id}"]

  tags {
    Project = "mt_devops"
  }
}

output "mt_devops_elb" {
  value = "${aws_elb.mt_devops.dns_name}"
}
