locals {
  resource_group_name = "${var.resource_group_name}-${var.prefix}"
  nsg_name            = "nsg-${var.prefix}"
  subnet_name         = "subnet-${var.prefix}"
  vnet_name           = "vnet-${var.prefix}"
}
