class role::traefik {
  include profile::consul_server
  include profile::traefik_server
}
