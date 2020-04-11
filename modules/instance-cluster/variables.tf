variable "do_region" {
    type	            = string
    description	      = "DigitalOcean API region in which to create the instances"
    default           = "ams3"
}

variable "do_instance_size" {
    type	            = string
    description	      = "DigitalOcean API instance size, specifying the resource assignment of the instance to spin up"
    default           = "s-1vcpu-2gb"

}

variable "do_private_networking" {
    type	            = bool
    description	      = "DigitalOcean API flag to enable or disable private networking between instances"
    default           = "true"
}

variable "do_monitoring" {
    type	            = bool
    description	      = "DigitalOcean API flag to enable or disable integrated monitoring of the instance, this will appear in your DO dashboard"
    default           = "true"
}

variable "do_ssh_fingerprint" {
    type	            = string
    description	      = "Fingeprint of the SSH public key to be used for authenticating login to the new instances"
}

variable "do_cluster_prefix" {
    type	            = string
    description	      = "Prefix to add to the node names"
    default           = ""
}

variable "do_cluster_postfix" {
    type	            = string
    description	      = "Postfix to add to the node names"
    default           = ""
}

variable "do_image" {
    type	            = string
    description	      = "Linux image to install on the new instances"
    default           = "ubuntu-18-04-x64"
}

variable "cluster_size" {
    type	            = number
    description	      = "Number of instances to create"
    default           = 3
}
