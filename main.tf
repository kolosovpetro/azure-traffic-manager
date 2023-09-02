data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = local.resource_group_name
}

module "network" {
  source                  = "./modules/network"
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = local.subnet_name
  vnet_name               = local.vnet_name
}

module "green_slot" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  domain_name_label                 = "greenslot${var.prefix}"
  ip_configuration_name             = "green-slot-ip-${var.prefix}"
  network_interface_name            = "green-slot-nic-${var.prefix}"
  nsg_name                          = "green-slot-nsg-${var.prefix}"
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "green-slot-vm-${var.prefix}"
  public_ip_name                    = "green-slot-ip-${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "green-slot-os-disk-${var.prefix}"
  subnet_id                         = module.network.subnet_id
  subnet_name                       = module.network.subnet_name
  vm_name                           = "green-slot-vm-${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name

  depends_on = [
    module.network
  ]
}

module "blue_slot" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  domain_name_label                 = "blueslot${var.prefix}"
  ip_configuration_name             = "blue-slot-ip-${var.prefix}"
  network_interface_name            = "blue-slot-nic-${var.prefix}"
  nsg_name                          = "blue-slot-nsg-${var.prefix}"
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "blue-slot-vm-${var.prefix}"
  public_ip_name                    = "blue-slot-ip-${var.prefix}"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "blue-slot-os-disk-${var.prefix}"
  subnet_id                         = module.network.subnet_id
  subnet_name                       = module.network.subnet_name
  vm_name                           = "blue-slot-vm-${var.prefix}"
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name

  depends_on = [
    module.network
  ]
}
