
variable "do_new_droplets" {
    type              = list(string)
    default           = []
}

#variable "do_adm_pwd" {
#    type              = string
#    default           = ""
#}

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
