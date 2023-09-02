variable "profile_name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the Traffic Manager profile will be created"
}
variable "relative_name" {
  type        = string
  description = "Relative DNS name of the Traffic Manager profile"
}
