output "container_name" {
  description = "Name of the Docker container"
  value       = docker_container.nginx.name
}

output "container_id" {
  description = "Docker container ID"
  value       = docker_container.nginx.id
}

output "nginx_url" {
  description = "URL to access Nginx"
  value       = "http://localhost:${var.container_port}"
}
