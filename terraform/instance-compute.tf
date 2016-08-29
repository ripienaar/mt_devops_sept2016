resource "template_file" "compute_init" {
  template = "${file("cloud-init/compute-node.txt")}"
  vars {
    puppet_master_ip = "${aws_instance.puppetmaster.private_ip}"
    atlas_user = "${var.atlas_user}/infrastructure"
    atlas_token = "${var.atlas_token}"
    role = "compute"
    forecast_io_token = "${var.forecast_io_token}"
  }
}

resource "aws_instance" "a_compute" {
  count = "${var.compute_count}"
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.medium"
  subnet_id = "${aws_subnet.public_a_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.internal.id}", "${aws_security_group.management.id}"]
  source_dest_check = false
  user_data = "${template_file.compute_init.rendered}"
  root_block_device {
    volume_type = "standard"
    volume_size = 8
    delete_on_termination = true
  }
  tags = {
    Project = "mt_devops"
  }
}

output "compute" {
  value = ["${aws_instance.a_compute.*.public_dns}"]
}
