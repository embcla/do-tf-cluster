provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.15"
}

provider "cloudflare" {
  version = "~> 2.1"
  api_token = var.cloudflare_api_token
}
