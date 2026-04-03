module "nginx_containers"{
    source = "../../modules/nginx"
    nginx_container_name_and_ports = {
      "staging-web-1" = "9084"
      "staging-web-2" = "9085"
    }
}

module "monitoring_containers" {
    source = "../../modules/monitoring"
    monitoring_containers = {
      "prometheus" = {
        image = "prom/prometheus"
        port = 9090
      } 
      "grafana" = {
        image = "grafana/grafana"
        port = 3000
      } 
    }
}