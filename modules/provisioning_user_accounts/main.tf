
data "digitalocean_droplet" "droplet1" {
    name                      = element(var.do_new_droplets, 0)
}

data "digitalocean_droplet" "droplet2" {
    name                      = element(var.do_new_droplets, 1)
}

data "digitalocean_droplet" "droplet3" {
    name                      = element(var.do_new_droplets, 2)
}

resource "null_resource" "cluster_setup_1" {
    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.do_pvt_key)
        timeout = "30s"
        host = data.digitalocean_droplet.droplet1.ipv4_address
    }
    provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            "useradd -m docker",
            "usermod -a -G sudo docker",
            "mkdir /home/docker/.ssh",
            "cp /root/.ssh/* /home/docker/.ssh",
            "chown -R docker:docker /home/docker/.ssh",
            "usermod --shell /bin/bash docker",
            "apt-get update",
            "apt-get install htop -y"
        ]
    }
}

resource "null_resource" "cluster_setup_2" {
    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.do_pvt_key)
        timeout = "30s"
        host = data.digitalocean_droplet.droplet2.ipv4_address
    }
    provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            "useradd -m docker",
            "usermod -a -G sudo docker",
            "mkdir /home/docker/.ssh",
            "cp /root/.ssh/* /home/docker/.ssh",
            "chown -R docker:docker /home/docker/.ssh",
            "usermod --shell /bin/bash docker",
            "apt-get update",
            "apt-get install htop -y"
        ]
    }
}


resource "null_resource" "cluster_setup_3" {
    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.do_pvt_key)
        timeout = "30s"
        host = data.digitalocean_droplet.droplet3.ipv4_address
    }
    provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            "useradd -m docker",
            "usermod -a -G sudo docker",
            "mkdir /home/docker/.ssh",
            "cp /root/.ssh/* /home/docker/.ssh",
            "chown -R docker:docker /home/docker/.ssh",
            "usermod --shell /bin/bash docker",
            "apt-get update",
            "apt-get install htop -y"
        ]
    }
}


output "droplet1" {
    value = data.digitalocean_droplet.droplet1
}
