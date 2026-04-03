variable "monitoring_containers" {
  type = map(object({
    image = string
    port  = number
  }))
}