# Create a resource group for networking
resource "azurerm_resource_group" "network" {
  name     = "${var.namespace}-network-rg"
  location = "${var.azure_region}"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = "${var.namespace}-network-vnet"
  resource_group_name = "${azurerm_resource_group.network.name}"
  location            = "${azurerm_resource_group.network.location}"
  address_space       = "${var.azure_networkCIDR}"

  subnet {
    name           = "Public"
    address_prefix = "10.2.2.0/24"
  }

  subnet {
    name           = "GatewaySubnet" # Must always be called "GatewaySubnet"
    address_prefix = "10.2.1.0/29"
  }
}
