resource "random_id" "shared_secret" {
  byte_length = 12
}

module "aws" {
  source = "./aws"

  aws_region = "${var.aws_region}"
  namespace  = "${var.namespace}"
}

module "azure" {
  source = "./azure"

  azure_region = "${var.azure_region}"
  namespace    = "${var.namespace}"
}

module "vpn" {
  source = "./vpn"

  namespace                             = "${var.namespace}"
  azure_region                          = "${var.azure_region}"
  azure_virtualNetworkId                = "${module.azure.virtualNetworkId}"
  azure_virtualNetworkResourceGroupName = "${module.azure.virtualNetworkResourceGroupName}"
  azure_virtualNetworkLocation          = "${module.azure.virtualNetworkLocation}"
  azure_gatewayName                     = "${var.azure_gatewayName}"
  azure_gatewaySku                      = "${var.azure_gatewaySku}"
  azure_vpnType                         = "${var.azure_vpnType}"
  azure_connectionName                  = "${var.azure_connectionName}"
  preSharedKey                          = "${random_id.shared_secret.hex}"
}
