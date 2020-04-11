
data "digitalocean_droplet" "droplet1" {
    name                      = element(var.do_new_droplets, 0)
}

data "digitalocean_droplet" "droplet2" {
    name                      = element(var.do_new_droplets, 1)
}

data "digitalocean_droplet" "droplet3" {
    name                      = element(var.do_new_droplets, 2)
}

resource "digitalocean_volume" "volume1" {
    region                    = var.do_region
    name                      = format("vol-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 1)
    size                      = var.do_block_volume_size
    initial_filesystem_type   = var.do_block_volume_format
    description               = format("Expansion volume for vol-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 1)
}

resource "digitalocean_volume" "volume2" {
    region                    = var.do_region
    name                      = format("vol-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 2)
    size                      = var.do_block_volume_size
    initial_filesystem_type   = var.do_block_volume_format
    description               = format("Expansion volume for vol-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 2)
}

resource "digitalocean_volume" "volume3" {
    region                    = var.do_region
    name                      = format("vol-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 3)
    size                      = var.do_block_volume_size
    initial_filesystem_type   = var.do_block_volume_format
    description               = format("Expansion volume for vol-%s-%s-%s-%02d",var.do_cluster_prefix, var.do_region, var.do_cluster_postfix, 3)
}



resource "digitalocean_volume_attachment" "attach01" {
    droplet_id                = element(var.do_new_droplet_ids, 0)
    volume_id                 = digitalocean_volume.volume1.id
}

resource "digitalocean_volume_attachment" "attach02" {
    droplet_id                = element(var.do_new_droplet_ids, 1)
    volume_id                 = digitalocean_volume.volume2.id
}

resource "digitalocean_volume_attachment" "attach03" {
    droplet_id                = element(var.do_new_droplet_ids, 2)
    volume_id                 = digitalocean_volume.volume3.id
}
