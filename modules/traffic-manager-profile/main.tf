resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                   = var.profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = var.relative_name
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}
