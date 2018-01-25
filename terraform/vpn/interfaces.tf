variable "namespace" {
  type = "string"
}

variable "azure_region" {
  type = "string"
}

variable "azure_virtualNetworkId" {
  type = "string"
}

variable "azure_virtualNetworkResourceGroupName" {
  type = "string"
}

variable "azure_virtualNetworkLocation" {
  type = "string"
}

variable "aws_gatewayIPAddress" {
  type    = "string"
  default = "2.13.14.15"
}

variable "aws_networkCIDR" {
  type    = "list"
  default = ["10.1.0.0/16"]
}

variable "azure_gatewayName" {
  type = "string"
}

variable "azure_gatewaySku" {
  type = "string"
}

variable "azure_vpnType" {
  type = "string"
}

variable "azure_connectionName" {
  type = "string"
}

variable "preSharedKey" {
  type = "string"
}
