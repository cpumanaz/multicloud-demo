module "aws" {
  source = "./aws"

  region    = "${var.aws_region}"
  namespace = "${var.namespace}"
}

module "azure" {
  source = "./azure"

  region    = "${var.azure_region}"
  namespace = "${var.namespace}"
}
