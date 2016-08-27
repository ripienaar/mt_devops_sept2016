class profile::registrator_server {
  include docker

  docker::run{"registrator":
    image   => "gliderlabs/registrator:latest",
    command => "--ip ${facts['ipaddress']} --cleanup --resync 120 consul://${facts['ipaddress']}:8500",
    volumes => ["/var/run/docker.sock:/tmp/docker.sock"],
    restart => "always",
  }
}
