class profile::consul_agent {
  include docker

  docker::run{"consul":
    image           => "consul",
    command         => "agent --atlas-join --atlas '${facts['atlas_user']}' --atlas-token '${facts['atlas_key']}' --advertise ${facts['ipaddress']}",
    env             => ["CONSUL_LOCAL_CONFIG='{\"client_addr\": \"0.0.0.0\"}'", "SERVICE_IGNORE=1"],
    restart         => "always",
    ports           => [
      "8300:8300/TCP",
      "8301:8301/TCP",
      "8301:8301/UDP",
      "8302:8302/TCP",
      "8302:8302/UDP",
      "8400:8400/TCP",
      "8500:8500/TCP",
      "8600:8600/TCP",
      "8600:8600/UDP"
    ]
  }
}
