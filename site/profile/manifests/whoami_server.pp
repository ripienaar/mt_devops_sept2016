class profile::whoami_server {
  include docker

  docker::run{"whoami":
    image   => "jwilder/whoami",
    restart => "always",
    ports   => [
      "8000:8000/TCP"
    ]
  }
}
