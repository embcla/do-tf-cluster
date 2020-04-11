
variable "do_new_droplets" {
    type              = list(string)
    default           = []
}

variable "do_region" {
    type	            = string
    description	      = "DigitalOcean API region in which to create the instances"
    default           = "ams3"
}

variable "cf_zone" {
    type                   = string
    description            = "String, the DNS zone for the new records"
    default                = "example.com"
}

variable "cf_subdomain" {
    type                   = string
    description            = "String, an optional subdomain for the cloudFlare DNS zone"
    default                = "example.com"
}

variable "do_domain" {
    type                   = string
    description            = "String, the top part of the domain, instances will be created as sub-domains of this"
    default                = "example.com"
}
