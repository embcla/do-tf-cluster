
data "digitalocean_droplet" "droplet1" {
    name                      = element(var.do_new_droplets, 0)
}

data "digitalocean_droplet" "droplet2" {
    name                      = element(var.do_new_droplets, 1)
}

data "digitalocean_droplet" "droplet3" {
    name                      = element(var.do_new_droplets, 2)
}

resource "digitalocean_domain" "domain1" {
name                          = format("%s.%s",data.digitalocean_droplet.droplet1.name, var.do_domain)
ip_address                    = data.digitalocean_droplet.droplet1.ipv4_address
}

resource "digitalocean_domain" "domain2" {
name                          = format("%s.%s",data.digitalocean_droplet.droplet2.name, var.do_domain)
ip_address                    = data.digitalocean_droplet.droplet2.ipv4_address
}

resource "digitalocean_domain" "domain3" {
  name                        = format("%s.%s",data.digitalocean_droplet.droplet3.name, var.do_domain)
  ip_address                  = data.digitalocean_droplet.droplet3.ipv4_address
}
