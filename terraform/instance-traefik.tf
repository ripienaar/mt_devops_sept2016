resource "template_file" "traefik_init" {
  template = "${file("cloud-init/compute-node.txt")}"
  vars {
    puppet_master_ip = "${aws_instance.puppetmaster.private_ip}"
    atlas_user = "${var.atlas_user}/infrastructure"
    atlas_token = "${var.atlas_token}"
    role = "traefik"
  }
}

resource "aws_instance" "a_traefik" {
  count = "${var.traefik_count}"
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public_a_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.internal.id}", "${aws_security_group.traefik.id}"]
  source_dest_check = false
  user_data = "${template_file.traefik_init.rendered}"

  root_block_device {
    volume_type = "standard"
    volume_size = 8
    delete_on_termination = true
  }

  tags = {
    Project = "mt_devops"
  }
}

resource "aws_instance" "b_traefik" {
  count = "${var.traefik_count}"
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public_b_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.internal.id}", "${aws_security_group.traefik.id}"]
  source_dest_check = false
  user_data = "${template_file.traefik_init.rendered}"

  root_block_device {
    volume_type = "standard"
    volume_size = 8
    delete_on_termination = true
  }

  tags = {
    Project = "mt_devops"
  }
}

output "traefik" {
  value = ["${aws_instance.a_traefik.*.public_dns}", "${aws_instance.b_traefik.*.public_dns}"]
}
