# main.tf

# Specify the required provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Define the Tomcat Docker image
resource "docker_image" "tomcat_image" {
  name = "tomcat:latest"
}

# Create the Tomcat container
resource "docker_container" "tomcat_container" {
  name  = "tomcat_server"
  image = docker_image.tomcat_image.image_id
  ports {
    internal = 8080
    external = 8092
  }
}

# Define the Nginx Docker image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Create the Nginx container
resource "docker_container" "nginx_container" {
  name  = "nginx_server"
  image = docker_image.nginx_image.image_id
  ports {
    internal = 80
    external = 8093
  }
}
