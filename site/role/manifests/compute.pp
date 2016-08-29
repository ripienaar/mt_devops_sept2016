class role::compute {
  include profile::consul_agent
  include profile::registrator_server
  include profile::whoami_server
  include mcollective
  include mcollective_agent_weather
}
