variable "namespace" {
  default = "mcdemo"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "azure_region" {
  default = "southcentralus"
}

provider "aws" {
  region = "${var.aws_region}"
}

provider "azurerm" {}
