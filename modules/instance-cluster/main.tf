




resource "digitalocean_droplet" "droplet1" {
  image                   = var.do_image
  name                    = format("vm-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 1)
  region                  = var.do_region
  size                    = var.do_instance_size
  private_networking      = var.do_private_networking
  monitoring 	            = var.do_monitoring
  ssh_keys 	              = [
                              var.do_ssh_fingerprint
                            ]
}

resource "digitalocean_droplet" "droplet2" {
  image                   = var.do_image
  name                    = format("vm-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 2)
  region                  = var.do_region
  size                    = var.do_instance_size
  private_networking      = var.do_private_networking
  monitoring 	            = var.do_monitoring
  ssh_keys 	              = [
                              var.do_ssh_fingerprint
                            ]
}

resource "digitalocean_droplet" "droplet3" {
  image                   = var.do_image
  name                    = format("vm-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 3)
  region                  = var.do_region
  size                    = var.do_instance_size
  private_networking      = var.do_private_networking
  monitoring 	            = var.do_monitoring
  ssh_keys 	              = [
                              var.do_ssh_fingerprint
                            ]
}
