resource "azurerm_traffic_manager_azure_endpoint" "example" {
  name               = var.traffic_manager_endpoint_name
  profile_id         = var.traffic_manager_profile_id
  weight             = var.traffic_manager_endpoint_weight
  target_resource_id = var.traffic_manager_endpoint_target_resource_id
}
