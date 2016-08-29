# mcollective_agent_weather version 1.0.0

#### Table of Contents

1. [Overview](#overview)
1. [Usage](#usage)
1. [Configuration](#configuration)

## Overview

Deployer for the weather application

The mcollective_agent_weather module is based on the source from https://github.com/ripienaar/weather-demo.

Available Actions:

  * **launch** - Launch a specific version of the weather app
  * **prepare** - Prepares the node for a release
  * **status** - Get the status of the weather app

## Usage

You can include this module into your infrastructure as any other module, but as it's designed to work with the [ripienaar mcollective](http://forge.puppet.com/ripienaar/mcollective) module you can configure it via Hiera:

```yaml
mcollective::plugin_classes:
  - mcollective_agent_weather
```

## Configuration

Server and Client configuration can be added via Hiera and managed through tiers in your site Hiera, they will be merged with any included in this module

```yaml
mcollective_agent_weather::config:
   example: value
```

This will be added to both the `client.cfg` and `server.cfg`, you can likewise configure server and client specific settings using `mcollective_agent_weather::client_config` and `mcollective_agent_weather::server_config`.

These settings will be added to the `/etc/puppetlabs/mcollective/plugin.d/` directory in individual files.

For a full list of possible configuration settings see the module [source repository documentation](https://github.com/ripienaar/weather-demo).

## Data Reference

  * `mcollective_agent_weather::gem_dependencies` - Deep Merged Hash of gem name and version this module depends on
  * `mcollective_agent_weather::manage_gem_dependencies` - disable managing of gem dependencies
  * `mcollective_agent_weather::package_dependencies` - Deep Merged Hash of package name and version this module depends on
  * `mcollective_agent_weather::manage_package_dependencies` - disable managing of packages dependencies
  * `mcollective_agent_weather::class_dependencies` - Array of classes to include when installing this module
  * `mcollective_agent_weather::package_dependencies` - disable managing of class dependencies
  * `mcollective_agent_weather::config` - Deep Merged Hash of common config items for this module
  * `mcollective_agent_weather::server_config` - Deep Merged Hash of config items specific to managed nodes
  * `mcollective_agent_weather::client_config` - Deep Merged Hash of config items specific to client nodes
  * `mcollective_agent_weather::policy_default` - `allow` or `deny`
  * `mcollective_agent_weather::policies` - List of `actionpolicy` policies to deploy with an agent
  * `mcollective_agent_weather::client` - installs client files when true - defaults to `$mcollective::client`
  * `mcollective_agent_weather::server` - installs server files when true - defaults to `$mcollective::server`
  * `mcollective_agent_weather::ensure` - `present` or `absent`
