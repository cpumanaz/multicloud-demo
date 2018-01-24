# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "production"
  location = "${var.region}"
}
