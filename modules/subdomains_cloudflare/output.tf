
output "cfzones" {
    value = data.cloudflare_zones.cfzones
}

output "cf_new_subdomain_name_1" {
    value = cloudflare_record.domain1
}

output "cf_new_subdomain_name_2" {
    value = cloudflare_record.domain2
}

output "cf_new_subdomain_name_3" {
    value = cloudflare_record.domain3
}
