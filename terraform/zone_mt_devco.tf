resource "aws_route53_zone" "mt_devops" {
  name = "mt_devops.devco.net"
}

resource "aws_route53_record" "mt_devops-ns" {
    zone_id = "${aws_route53_zone.mt_devops.zone_id}"
    name = "mt_devops.devco.net"
    type = "NS"
    ttl = "30"
    records = [
      "${aws_route53_zone.mt_devops.name_servers.0}",
      "${aws_route53_zone.mt_devops.name_servers.1}",
      "${aws_route53_zone.mt_devops.name_servers.2}",
      "${aws_route53_zone.mt_devops.name_servers.3}"
    ]
}

resource "aws_route53_record" "weather_mt_devops-ns" {
    zone_id = "${aws_route53_zone.mt_devops.zone_id}"
    name = "weather.mt_devops.devco.net"
    type = "CNAME"
    ttl = "30"
    records = ["${aws_elb.mt_devops.dns_name}."]
}

resource "aws_route53_record" "whois_mt_devops-ns" {
    zone_id = "${aws_route53_zone.mt_devops.zone_id}"
    name = "whoami.mt_devops.devco.net"
    type = "CNAME"
    ttl = "30"
    records = ["${aws_elb.mt_devops.dns_name}."]
}

resource "aws_route53_record" "shell_mt_devops-ns" {
    zone_id = "${aws_route53_zone.mt_devops.zone_id}"
    name = "shell.mt_devops.devco.net"
    type = "CNAME"
    ttl = "30"
    records = ["${aws_instance.puppetmaster.public_dns}."]
}

output "mt_devops_nameservers" {
  value = [
    "${aws_route53_zone.mt_devops.name_servers.0}",
    "${aws_route53_zone.mt_devops.name_servers.1}",
    "${aws_route53_zone.mt_devops.name_servers.2}",
    "${aws_route53_zone.mt_devops.name_servers.3}"
  ]
}
