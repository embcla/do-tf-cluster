
data "digitalocean_droplet" "droplet1" {
    name                      = element(var.do_new_droplets, 0)
}

data "digitalocean_droplet" "droplet2" {
    name                      = element(var.do_new_droplets, 1)
}

data "digitalocean_droplet" "droplet3" {
    name                      = element(var.do_new_droplets, 2)
}

#resource "null_resource" "etcd_unitfile_copy" {
#    connection {
#        user = "root"
#        type = "ssh"
#        private_key = file(var.do_pvt_key)
#        timeout = "30s"
#        host = data.digitalocean_droplet.droplet1.ipv4_address
#    }
#
#    provisioner "file" {
#      source      = "etcd.service"
#      destination = "/root/"
#    }
#}

#resource "null_resource" "etcd_unitfile_copy_2" {
#    connection {
#        user = "root"
#        type = "ssh"
#        private_key = file(var.do_pvt_key)
#        timeout = "30s"
#        host = data.digitalocean_droplet.droplet2.ipv4_address
#    }
#
#    provisioner "file" {
#      source      = "etcd.service"
#      destination = "/root/"
#    }
#}

#resource "null_resource" "etcd_unitfile_copy_3" {
#    connection {
#        user = "root"
#        type = "ssh"
#        private_key = file(var.do_pvt_key)
#        timeout = "30s"
#        host = data.digitalocean_droplet.droplet3.ipv4_address
#    }
#
#    provisioner "file" {
#      source      = "etcd.service"
#      destination = "/root/"
#    }
#}

resource "null_resource" "etcd_cluster_setup_1" {
    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.do_pvt_key)
        timeout = "30s"
        host = data.digitalocean_droplet.droplet1.ipv4_address
    }

    provisioner "file" {
      source      = "./files/etcd.service"
      destination = "/root/etcd.service"
    }

    provisioner "file" {
      source      = "./files/check_etcd_service.sh"
      destination = "/root/check_etcd_service.sh"
    }

    provisioner "file" {
      source      = "./files/set_env.sh"
      destination = "/root/set_env.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "apt-get remove --purge etcd etcd-client -y",
            "apt-get install etcd etcd-client -y",
            "systemctl stop etcd",
            "systemctl disable etcd",
            "chmod +x check_etcd_service.sh",
            "chmod +x set_env.sh",
            "export ETCD_NAME_1=${data.digitalocean_droplet.droplet1.name}",
            "export ETCD_NAME_2=${data.digitalocean_droplet.droplet2.name}",
            "export ETCD_NAME_3=${data.digitalocean_droplet.droplet3.name}",
            "export ETCD_NAME=$ETCD_NAME_1",
            "export ETCD_VOLUME=/mnt/${element(var.do_new_volumes,0)}",
            "export ETCD_FOLDER=/mnt/${element(var.do_new_volumes,0)}/etcd",
            "export ETCD_TOKEN=${var.etcd_cluster_token}",
            "export ETCD_MACHINE_1=${data.digitalocean_droplet.droplet1.ipv4_address_private}",
            "export ETCD_MACHINE_2=${data.digitalocean_droplet.droplet2.ipv4_address_private}",
            "export ETCD_MACHINE_3=${data.digitalocean_droplet.droplet3.ipv4_address_private}",
            "export ETCD_HOST_IP=$ETCD_MACHINE_1",
            "eval \"$(./set_env.sh)\"",
            "./check_etcd_service.sh",
            "chown -R etcd:etcd $ETCD_FOLDER",
            "envsubst < etcd.service > /lib/systemd/system/etcd.service",
            "systemctl enable etcd",
            "systemctl start etcd"
        ]
    }
}

resource "null_resource" "etcd_cluster_setup_2" {
    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.do_pvt_key)
        timeout = "30s"
        host = data.digitalocean_droplet.droplet2.ipv4_address
    }

    provisioner "file" {
      source      = "./files/etcd.service"
      destination = "/root/etcd.service"
    }

    provisioner "file" {
      source      = "./files/check_etcd_service.sh"
      destination = "/root/check_etcd_service.sh"
    }

    provisioner "file" {
      source      = "./files/set_env.sh"
      destination = "/root/set_env.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "apt-get remove --purge etcd etcd-client -y",
            "apt-get install etcd etcd-client -y",
            "systemctl stop etcd",
            "systemctl disable etcd",
            "chmod +x check_etcd_service.sh",
            "chmod +x set_env.sh",
            "export ETCD_NAME_1=${data.digitalocean_droplet.droplet1.name}",
            "export ETCD_NAME_2=${data.digitalocean_droplet.droplet2.name}",
            "export ETCD_NAME_3=${data.digitalocean_droplet.droplet3.name}",
            "export ETCD_NAME=$ETCD_NAME_2",
            "export ETCD_VOLUME=/mnt/${element(var.do_new_volumes,1)}",
            "export ETCD_FOLDER=/mnt/${element(var.do_new_volumes,1)}/etcd",
            "export ETCD_TOKEN=${var.etcd_cluster_token}",
            "export ETCD_MACHINE_1=${data.digitalocean_droplet.droplet1.ipv4_address_private}",
            "export ETCD_MACHINE_2=${data.digitalocean_droplet.droplet2.ipv4_address_private}",
            "export ETCD_MACHINE_3=${data.digitalocean_droplet.droplet3.ipv4_address_private}",
            "export ETCD_HOST_IP=$ETCD_MACHINE_2",
            "eval \"$(./set_env.sh)\"",
            "./check_etcd_service.sh",
            "chown -R etcd:etcd $ETCD_FOLDER",
            "envsubst < etcd.service > /lib/systemd/system/etcd.service",
            "systemctl enable etcd",
            "systemctl start etcd"
        ]
    }
}
resource "null_resource" "etcd_cluster_setup_3" {
    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.do_pvt_key)
        timeout = "30s"
        host = data.digitalocean_droplet.droplet3.ipv4_address
    }

    provisioner "file" {
      source      = "./files/etcd.service"
      destination = "/root/etcd.service"
    }

    provisioner "file" {
      source      = "./files/check_etcd_service.sh"
      destination = "/root/check_etcd_service.sh"
    }

    provisioner "file" {
      source      = "./files/set_env.sh"
      destination = "/root/set_env.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "apt-get remove --purge etcd etcd-client -y",
            "apt-get install etcd etcd-client -y",
            "systemctl stop etcd",
            "systemctl disable etcd",
            "chmod +x check_etcd_service.sh",
            "chmod +x set_env.sh",
            "export ETCD_NAME_1=${data.digitalocean_droplet.droplet1.name}",
            "export ETCD_NAME_2=${data.digitalocean_droplet.droplet2.name}",
            "export ETCD_NAME_3=${data.digitalocean_droplet.droplet3.name}",
            "export ETCD_NAME=$ETCD_NAME_3",
            "export ETCD_VOLUME=/mnt/${element(var.do_new_volumes,2)}",
            "export ETCD_FOLDER=/mnt/${element(var.do_new_volumes,2)}/etcd",
            "export ETCD_TOKEN=${var.etcd_cluster_token}",
            "export ETCD_MACHINE_1=${data.digitalocean_droplet.droplet1.ipv4_address_private}",
            "export ETCD_MACHINE_2=${data.digitalocean_droplet.droplet2.ipv4_address_private}",
            "export ETCD_MACHINE_3=${data.digitalocean_droplet.droplet3.ipv4_address_private}",
            "export ETCD_HOST_IP=$ETCD_MACHINE_3",
            "eval \"$(./set_env.sh)\"",
            "./check_etcd_service.sh",
            "chown -R etcd:etcd $ETCD_FOLDER",
            "envsubst < etcd.service > /lib/systemd/system/etcd.service",
            "systemctl enable etcd",
            "systemctl start etcd"
        ]
    }
}
