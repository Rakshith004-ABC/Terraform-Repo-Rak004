provider "azurerm" {
  features {}
}

# Define the Resource Group
resource "azurerm_resource_group" "example" {
  name     = "rak004-cosmos-db"
  location = "East US 2" # Replace with your preferred location
}

# Define the PostgreSQL Server
resource "azurerm_postgresql_server" "example" {
  name                = "rak004cdb"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # Server Configuration
  sku_name                     = "B_Gen5_1"     
  storage_mb                   = 5120          
  version                      = "11"          
  administrator_login          = "rakshith"     
  administrator_login_password = "Password123@"

  # Configure Network & Access
  public_network_access_enabled = true
  ssl_enforcement_enabled       = true
}

# Define Firewall Rule to Allow Access from All Azure Services
resource "azurerm_postgresql_firewall_rule" "allow_azure" {
  name                = "AllowAzureServices"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


# Create a Database in the PostgreSQL Server
resource "azurerm_postgresql_database" "example_db" {
  name                = "rak004cdb"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
