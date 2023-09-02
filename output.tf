output "username" {
  value = var.os_profile_admin_username
}

output "green_public_ip" {
  value = module.green_slot.public_ip
}

output "blue_public_ip" {
  value = module.blue_slot.public_ip
}
