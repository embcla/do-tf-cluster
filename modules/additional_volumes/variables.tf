
variable "do_new_droplets" {
    type              = list(string)
    default           = []
}

variable "do_new_droplet_ids" {
    type              = list(string)
    default           = []
}

variable "do_region" {
    type	            = string
    description	      = "DigitalOcean API region in which to create the instances"
    default           = "ams3"
}

variable "do_block_volume_format" {
    type	            = string
    description	      = "format of additional volumes, ext4 or xfs"
    default           = "ext4"
}

variable "do_block_volume_size" {
    type	            = number
    description	      = "Size in GiB (1024^3) of the additional block storage volume"
    default           = 100
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
