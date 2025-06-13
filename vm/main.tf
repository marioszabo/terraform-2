resource "azurerm_linux_virtual_machine" "example" {
  count               = var.vm_count
  name                = "example-vm-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.admin_username

  network_interface_ids = var.network_interface_id

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.vm_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}