variable "namespace" {
  default = "mcdemo"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "azure_region" {
  default = "southcentralus"
}

variable "azure_vpnType" {
  default = "RouteBased"
}

variable "azure_gatewayName" {
  default = "vpn-gw"
}

variable "azure_gatewaySku" {
  default = "Basic"
}

variable "azure_connectionName" {
  default = "azure-aws-connection"
}

provider "aws" {
  region = "${var.aws_region}"
}

provider "azurerm" {}
