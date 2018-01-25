# Create an object which represents the AWS VPN gateway
resource "azurerm_local_network_gateway" "aws" {
  name                = "${var.namespace}-network-lgw-aws"
  resource_group_name = "${var.azure_virtualNetworkResourceGroupName}"
  location            = "${var.azure_virtualNetworkLocation}"
  gateway_address     = "${var.aws_gatewayIPAddress}"
  address_space       = "${var.aws_networkCIDR}"
}

# Create an IP Address to use for the Azure VPN gateway
resource "azurerm_public_ip" "vng" {
  name                         = "${var.namespace}-network-vng-pip"
  resource_group_name          = "${var.azure_virtualNetworkResourceGroupName}"
  location                     = "${var.azure_virtualNetworkLocation}"
  public_ip_address_allocation = "dynamic"
}

# Create VPN gateway, and Connection objects through template
resource "azurerm_template_deployment" "vpn" {
  name                = "${var.namespace}-network-vpn-gw"
  resource_group_name = "${var.azure_virtualNetworkResourceGroupName}"
  deployment_mode     = "Incremental"
  template_body       = "${file("./ARM/vpn-gateway.json")}"

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    virtualNetworkId   = "${var.azure_virtualNetworkId}"
    localGatewayId     = "${azurerm_local_network_gateway.aws.id}"
    gatewayName        = "${var.azure_gatewayName}"
    gatewaySku         = "${var.azure_gatewaySku}"
    gatewayIPAddressId = "${azurerm_public_ip.vng.id}"
    vpnType            = "${var.azure_vpnType}"
    connectionName     = "${var.azure_connectionName}"
    preSharedKey       = "${var.preSharedKey}"
  }
}
