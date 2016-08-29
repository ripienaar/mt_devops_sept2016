class role::puppet_master {
  include nats

  class{"mcollective_agent_weather":
    client => true,
    server => false
  }
}
