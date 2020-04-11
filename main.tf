module "build_infra" {
  source                = "./modules/instance-cluster"
  do_ssh_fingerprint    = var.ssh_fingerprint
  do_monitoring         = var.monitoring
  do_private_networking = var.private_networking
  do_cluster_prefix     = var.cluster_prefix
  do_cluster_postfix    = var.cluster_postfix

}

module "provisioning_user_accounts" {
  source                = "./modules/provisioning_user_accounts"
  do_new_droplets       = [module.build_infra.do_new_droplet_name_1, module.build_infra.do_new_droplet_name_2, module.build_infra.do_new_droplet_name_3]
  do_pvt_key            = var.pvt_key
}

module "additional_volumes" {
  source                = "./modules/additional_volumes"
  do_new_droplets       = [module.build_infra.do_new_droplet_name_1, module.build_infra.do_new_droplet_name_2, module.build_infra.do_new_droplet_name_3]
  do_new_droplet_ids    = [module.build_infra.do_new_droplet_id_1, module.build_infra.do_new_droplet_id_2, module.build_infra.do_new_droplet_id_3]
  do_cluster_prefix     = var.cluster_prefix
  do_cluster_postfix    = var.cluster_postfix
}

module "subdomains_cloudflare" {
  source                = "./modules/subdomains_cloudflare"
  do_domain             = format("%s.%s", var.cloudflare_subdomain, var.cloudflare_zone)
  cf_zone               = var.cloudflare_zone
  cf_subdomain          = var.cloudflare_subdomain
  do_new_droplets       = [module.build_infra.do_new_droplet_name_1, module.build_infra.do_new_droplet_name_2, module.build_infra.do_new_droplet_name_3]
}

#module "subdomains_digitalocean" {
#  source                = "./modules/subdomains_digitalocean"
#  do_domain             = format("%s.%s", var.cloudflare_subdomain, var.cloudflare_zone)
#  do_new_droplets       = [module.build_infra.do_new_droplet_name_1, module.build_infra.do_new_droplet_name_2, module.build_infra.do_new_droplet_name_3]
#}

module "provisioning_etcd" {
  source                = "./modules/provisioning_etcd"
  do_new_droplets       = [module.build_infra.do_new_droplet_name_1, module.build_infra.do_new_droplet_name_2, module.build_infra.do_new_droplet_name_3]
  do_new_volumes        = [replace(module.additional_volumes.do_new_volume_name_1, "-", "_"), replace(module.additional_volumes.do_new_volume_name_2, "-", "_"), replace(module.additional_volumes.do_new_volume_name_3, "-", "_")]
  do_pvt_key            = var.pvt_key
}
