terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  backend "http" {
    address = "https://gitlab.com/api/v4/projects/Syenta-Elf%2Fterraform-state/terraform/state/dev"
    lock_address   = "https://gitlab.com/api/v4/projects/Syenta-Elf%2Fterraform-state/terraform/state/dev/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/Syenta-Elf%2Fterraform-state/terraform/state/dev/lock"
    username       = "Syenta-Elf"
    lock_method    = "POST"
    unlock_method  = "DELETE"
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}