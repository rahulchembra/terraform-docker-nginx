terraform {
  required_version = ">= 1.5.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}


# On Linux this default socket is used automatically; uncomment if you need to be explicit.
provider "docker" {
  # host = "unix:///var/run/docker.sock"
}

# A dedicated network for our container (optional but clean)
resource "docker_network" "demo" {
  name = "tf-demo-net"
}

# Pull the image (and keep it locally after destroy)
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

# Run the container
resource "docker_container" "web" {
  name  = "tf-nginx"
  image = docker_image.nginx.image_id

  # attach to our network
  networks_advanced {
    name = docker_network.demo.name
  }

  # publish container port 80 -> host port 8080
  ports {
    internal = 80
    external = 8080
  }

  # simple example env var
  env = ["TZ=Asia/Kolkata"]

  # restart policy so it survives reboots
  restart = "unless-stopped"
}

# Handy outputs
output "container_id" { value = docker_container.web.id }
output "container_name" { value = docker_container.web.name }
output "web_url" { value = "http://localhost:8080" }
