terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2376"
}

# Define la imagen de Docker que deseas crear
resource "docker_image" "back" {
  name         = "node-back:latest"  # Nombre de la imagen y etiqueta
  keep_locally = false           # Indica si mantener la imagen local después de aplicar cambios
}

# Define la imagen de Docker que deseas crear
resource "docker_image" "front" {
  name         = "node-front:latest"  # Nombre de la imagen y etiqueta
  keep_locally = false           # Indica si mantener la imagen local después de aplicar cambios
}

# Define la imagen de Docker que deseas crear
resource "docker_image" "bdd" {
  name         = "mongo:latest"  # Nombre de la imagen y etiqueta
  keep_locally = false           # Indica si mantener la imagen local después de aplicar cambios
}

resource "docker_container" "backend_container" {
    image = docker_image.back.name # Usa la imagen creada anteriormente
    name  = "backend"                # Nombre del contenedor
    ports {
        internal = 3000  # Puerto interno del contenedor
        external = 145  # Puerto externo del contenedor
    }
}

resource "docker_container" "frontend_container" {
    image = docker_image.front.name # Usa la imagen creada anteriormente
    name  = "frontend"                # Nombre del contenedor
    ports {
        internal = 3001  # Puerto interno del contenedor
        external = 144  # Puerto externo del contenedor
    }
}

resource "docker_container" "bdd"{
    image = docker_image.bdd.name # Usa la imagen creada anteriormente
    name  = "basededatos"                # Nombre del contenedor
    ports {
        internal = 3002  # Puerto interno del contenedor
        external = 143  # Puerto externo del contenedor
    }
}