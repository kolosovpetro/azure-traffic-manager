variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "Resource group location"
}

variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "os_profile_admin_public_key_path" {
  type        = string
  description = "Path to public key for admin user"
}
variable "os_profile_admin_username" {
  type        = string
  description = "Admin username"
}

variable "storage_image_reference_offer" {
  type        = string
  description = "Offer of the image used to create the virtual machine"
}

variable "storage_image_reference_publisher" {
  type        = string
  description = "Publisher of the image used to create the virtual machine"
}

variable "storage_image_reference_sku" {
  type        = string
  description = "SKU of the image used to create the virtual machine"
}

variable "storage_image_reference_version" {
  type        = string
  description = "Version of the image used to create the virtual machine"
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Caching of the OS disk"
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Create option of the OS disk"
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Managed disk type of the OS disk"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
}
