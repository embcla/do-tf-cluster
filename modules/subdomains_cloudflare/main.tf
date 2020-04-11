
data "cloudflare_zones" "cfzones" {
  filter {
    name   = var.cf_zone
    status = "active"
    paused = false
  }
}


data "digitalocean_droplet" "droplet1" {
    name                      = element(var.do_new_droplets, 0)
}

data "digitalocean_droplet" "droplet2" {
    name                      = element(var.do_new_droplets, 1)
}

data "digitalocean_droplet" "droplet3" {
    name                      = element(var.do_new_droplets, 2)
}


resource "cloudflare_record" "domain1" {
  zone_id                     = data.cloudflare_zones.cfzones.zones[0].id
  name                        = format("%s.%s",data.digitalocean_droplet.droplet1.name, var.do_domain)
  value                       = data.digitalocean_droplet.droplet1.ipv4_address
  type                        = "A"
  ttl                         = 1800
  proxied                     = "false"
}

resource "cloudflare_record" "domain2" {
  zone_id                     = data.cloudflare_zones.cfzones.zones[0].id
  name                        = format("%s.%s",data.digitalocean_droplet.droplet2.name, var.do_domain)
  value                       = data.digitalocean_droplet.droplet2.ipv4_address
  type                        = "A"
  ttl                         = 1800
  proxied                     = "false"
}

resource "cloudflare_record" "domain3" {
  zone_id                     = data.cloudflare_zones.cfzones.zones[0].id
  name                        = format("%s.%s",data.digitalocean_droplet.droplet3.name, var.do_domain)
  value                       = data.digitalocean_droplet.droplet3.ipv4_address
  type                        = "A"
  ttl                         = 1800
  proxied                     = "false"
}
