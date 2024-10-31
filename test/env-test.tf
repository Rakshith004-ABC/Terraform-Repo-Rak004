variable "global_var" {
  description = "A global variable for all users"
  type        = string
}

output "global_variable_value" {
  value = var.global_var
}
