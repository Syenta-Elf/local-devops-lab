resource "docker_image" "pull_nginx" {
  name = "nginx:latest"
}

resource "docker_container" "container_nginx" {
  image = docker_image.pull_nginx.image_id
  name = each.key
  ports  {
    internal = 80
    external = each.value
    }
  lifecycle {
    ignore_changes = [network_mode]
  }
  for_each = var.nginx_container_name_and_ports
}


