
variable "do_new_droplets" {
    type              = list(string)
}


variable "do_new_volumes" {
    type              = list(string)
}

variable "etcd_cluster_token" {
    type              = string
    default           = "etcd-cluster-token"
}

variable "etcd_cluster_name" {
    type              = string
    default           = "etcd"
}

variable "etcd_data_dir" {
    type              = string
    default           = "/var/lib/etcd"
}

variable "do_region" {
    type	            = string
    description	      = "DigitalOcean API region in which to create the instances"
    default           = "ams3"
}

variable "cluster_size" {
    type	            = number
    description	      = "Number of instances to create"
    default           = 3
}

variable "do_pvt_key" {
    type	            = string
    description	      = "SSH key"
    default           = ""
}
