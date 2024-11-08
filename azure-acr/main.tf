# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Define the resource group
resource  "azurerm_resource_group" "example" {
  name     = "RakACR-Res"
  location = "East US"
}

# Create the Azure Container Registry
resource "azurerm_container_registry" "example" {
  name                = "Rak004acr"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Output the ACR login server
output "acr_login_server" {
  value = azurerm_container_registry.example.login_server
}
