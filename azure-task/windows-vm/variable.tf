variable "rg_name" {
  default = "terraform_win_rg"
}

variable "location" {
  default = "eastus2"
}

variable "address_space" {
  default = ["10.1.0.0/16"]
  type    = list(string)
}

variable "vnet_name" {
  default = "terraform_vnet"
}
variable "subnet_space" {
  default = ["10.1.0.0/24", "10.1.10.0/24"]
  type    = list(string)
}

variable "subnet_name" {
  default = "terraform_snet"
}

variable "nic_name" {
  default = "terraform_win_nic"
}
variable "pip_name" {
  default = "pip"
}
variable "ip_name" {
  default = "ip"
}
variable "vm_name" {
  default = "Windows10-Rak-TF"
}
variable "admin_username" {
  default = "rakshith004"
}
variable "admin_password" {
  default   = "Password123@"
  sensitive = true
}

variable "user" {
  default = "azureuser"
}
variable "nsg" {
  default = "Rak-nsg"
}

variable "size" {
  description = "VM size"
  default     = "Standard_D2s_v3"
}
