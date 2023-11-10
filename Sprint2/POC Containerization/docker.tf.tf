terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "2.13.0"
        }
    }
}
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
resource "docker_image" "nginx" {
    name = "nginx:latest"
    keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name = "new"
  ports {
    external = 80
    internal = 80
  }
}