variable "namespace" {}

variable "region" {
  type = "string"
}

variable "vpc_cidr_block" {
  default = "10.1.0.0/16"
}

output "cidr" {
  value = "${var.vpc_cidr_block}"
}

output "region" {
  value = "${var.region}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
