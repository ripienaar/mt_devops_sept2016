class profile::traefik_server {
  include docker

  file{"/etc/traefik.toml":
    content => epp("profile/traefik.epp"),
    owner   => "root",
    group   => "root",
    mode    => "0400"
  } ->

  docker::run{"traefik":
    image   => "traefik",
    env     => ["SERVICE_IGNORE=1"],
    volumes => ["/etc/traefik.toml:/etc/traefik/traefik.toml"],
    restart => "always",
    ports   => [
      "80:80",
      "443:443",
      "8080:8080"
    ]
  }
}
