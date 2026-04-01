output "deneme"{
 value = {
  for k, v in docker_container.container_nginx : k => v.id
  }
}