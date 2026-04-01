module "nginx_cluster" {
  source = "./modules/nginx"
  nginx_container_name_and_ports = {
    "web-1" = "9081"
    "web-2" = "9082"
  }
}