variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret access key"
}

variable "atlas_user" {
  description = "Username for Hashicorp Atlas"
}

variable "atlas_token" {
  description = "Access token for Hashcorp Atlas"
}

variable "compute_count" {
  description = "Amount of compute instances per AZ"
  default = 3
}

variable "traefik_count" {
  description = "Amount of traefik instances per AZ"
  default = 2
}

variable "region" {
  description = "AWS region to host your networks"
  default     = "eu-central-1"
}

variable "avail_zone_a" {
  description = "AWS availability zone to host your A network"
  default     = "eu-central-1a"
}

variable "avail_zone_b" {
  description = "AWS availability zone to host your B network"
  default     = "eu-central-1b"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "CIDR for public subnet in availability zone A"
  default     = "10.128.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR for public subnet in availability zone B"
  default     = "10.128.2.0/24"
}

/* https://aws.amazon.com/marketplace/ordering?productId=b7ee8a69-ee97-4a49-9e68-afaee216db2e&ref_=dtl_psb_continue&region=us-east-1 */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    eu-central-1 = "ami-9bf712f4"
  }
}
