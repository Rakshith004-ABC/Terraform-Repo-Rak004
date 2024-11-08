variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet within the VNet"
  type        = string
}

variable "linux_vm_name" {
  description = "Name of the Linux VM"
  type        = string
}

variable "windows_vm_name" {
  description = "Name of the Windows VM"
  type        = string
}

variable "linux_admin_username" {
  description = "Admin username for Linux VM"
  type        = string
}

variable "windows_admin_username" {
  description = "Admin username for Windows VM"
  type        = string
}

variable "linux_admin_password" {
  description = "Admin password for Linux VM"
  type        = string
  sensitive   = true
}

variable "windows_admin_password" {
  description = "Admin password for Windows VM"
  type        = string
  sensitive   = true
}

variable "linux_vm_size" {
  description = "Size of the Linux VM"
  type        = string
  default     = "Standard_B1s"
}

variable "windows_vm_size" {
  description = "Size of the Windows VM"
  type        = string
  default     = "Standard_B1s"
}
