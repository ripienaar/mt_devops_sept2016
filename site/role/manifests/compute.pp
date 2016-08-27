class role::compute {
  include profile::consul_agent
  include profile::registrator_server
}
