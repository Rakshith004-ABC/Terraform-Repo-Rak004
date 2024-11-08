# Network Interface for Linux VM
resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.linux_vm_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "linux-ip-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Linux VM (Ubuntu 22.04)
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                  = var.linux_vm_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.linux_nic.id]
  size                  = var.linux_vm_size

admin_username = var.linux_admin_username

  # Set up SSH key authentication
  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  disable_password_authentication = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
