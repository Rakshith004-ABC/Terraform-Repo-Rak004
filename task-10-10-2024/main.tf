provider "random" {}

# Input variable with a default value
variable "resource_name" {
  type    = string
  default = "default-resource-name"
}

# Random string resource to add randomness
resource "random_string" "name_suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric  = true
  special = false
}

# Example resource using the injected value
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Creating resource with name ${var.resource_name}-${random_string.name_suffix.result}'"
  }
}

# Output to show the final name
output "final_resource_name" {
  value = "${var.resource_name}-${random_string.name_suffix.result}"
}
