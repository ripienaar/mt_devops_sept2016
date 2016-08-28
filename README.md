What?
=====

Terraform and Puppet code to build a multi AZ docker compute setup with traefik
and an ELB

Each AZ has:

  * 2 x Traefik + Consul servers per region - not ideal as you'd rather have
    a seperate consul cluster made up of an odd amount of nodes
  * 3 x Docker compute nodes with consul client and registrator

Additionally there is a Puppet Master running MCollective setup with Choria

Any containers that start with exposed ports will immediately appear and be
load balanced by the traefik cluster

**NOTE:** today you would probably rather use ECS, Kubernetes, Deis or any of
these tools to achieve this kind of setup, this is merely to support a talk
and not meant as an indication of what I think a prod setup should look like

![AWS Network Architecture](aws.png)
