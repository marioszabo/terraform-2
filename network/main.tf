resource "azurerm_virtual_network" "MyNetwork" {
  name                = "my-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "MySubnet" {
  name                 = "testsubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.MyNetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}
# Added comment to test PR

resource "azurerm_network_interface" "example" {
  count               = var.vm_count
  name                = "example-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.MySubnet.id
    private_ip_address_allocation = "Dynamic"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "azurerm_network_security_group" "example-sg" {

  name                = "example-sg"
  location            = var.location
  resource_group_name = var.resource_group_name


  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "lb-public-ip" {
  name                = "publicip_lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

}


resource "azurerm_lb" "example-lb" {
  name                = "example-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.lb-public-ip.id
  }
}
