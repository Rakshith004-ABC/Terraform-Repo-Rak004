provider "random" {}

locals {
  # List of names for random strings
  names = ["one", "two", "three", "four"]
}

resource "random_id" "example_id" {
  count = length(local.names) # Creates one resource per item in 'local.names'

  byte_length = 8
}

resource "random_string" "example_string" {
  for_each = toset(local.names) # Create a resource for each unique name in 'local.names'

  length  = 16
  special = true
}

locals {
  id_results     = [for id in random_id.example_id : id.b64_url]
  string_results = { for name, string in random_string.example_string : name => string.result }
}

output "random_ids" {
  value       = local.id_results
  description = "Base64 URL-encoded random IDs"
}

output "random_strings" {
  value       = local.string_results
  description = "Generated random strings with names as keys"
}

