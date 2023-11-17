terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "ssh-droplet-key" {
  name       = "Terraform created SSH key"
  public_key =  file("${path.module}/files/id_rsa.pub")
}

resource "digitalocean_droplet" "web" {
  count              = 3
  image              = "ubuntu-20-04-x64"
  name               = "web-${count.index}"
  region             = "nyc1"
  size               = "s-2vcpu-2gb"
  private_networking = true
  monitoring         = true
  ssh_keys = [
    digitalocean_ssh_key.ssh-droplet-key.id
  ]
  user_data = file("${path.module}/files/user_data.sh")
}

