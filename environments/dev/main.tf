module "nginx_cluster" {
  source = "../../modules/nginx"
  nginx_container_name_and_ports = {
    "web-3" = "9083"
  }
}

module "monitoring" {
  source = "../../modules/monitoring"
  monitoring_containers = {
    "prometheus" = {
      image = "prom/prometheus:latest"
      port  = 9090
    }
    "grafana" = {
      image = "grafana/grafana:latest"
      port  = 3000
    }
  }
}