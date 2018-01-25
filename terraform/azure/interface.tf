variable "namespace" {
  type = "string"
}

variable "azure_region" {
  type = "string"
}

variable "azure_networkCIDR" {
  type    = "list"
  default = ["10.2.0.0/16"]
}

output "virtualNetworkId" {
  value = "${azurerm_virtual_network.network.id}"
}

output "virtualNetworkResourceGroupName" {
  value = "${azurerm_resource_group.network.name}"
}

output "virtualNetworkLocation" {
  value = "${azurerm_resource_group.network.location}"
}
