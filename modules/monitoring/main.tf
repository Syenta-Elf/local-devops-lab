resource "docker_image" "pull_monitoring_images" {
  name = each.value.image
  for_each = var.monitoring_containers
}

resource "docker_container" "monitoring_containers" {
  for_each = var.monitoring_containers
  image = docker_image.pull_monitoring_images[each.key].image_id
  name = each.key
  ports  {
    internal = each.value.port
    external = each.value.port
    }
  lifecycle {
    ignore_changes = [network_mode]
  }
}