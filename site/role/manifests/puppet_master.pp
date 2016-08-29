class role::puppet_master {
  include nats

  include mcollective

  class{"mcollective_agent_weather":
    client => true,
    server => false
  }
}
