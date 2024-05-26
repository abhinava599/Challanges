
output "vm_private_ips" {
  value = { for k, v in azurerm_linux_virtual_machine.vms : v.name => v.private_ip_address }
}
output "vm_public_ips" {
  value = { for k, v in azurerm_linux_virtual_machine.vms : v.name => v.public_ip_address }
}

output "vm_nic_ids" {
  value = { for k, v in azurerm_linux_virtual_machine.vms : v.name => v.network_interface_ids[0] }
}

output "vm_ids" {
  value = { for k, v in azurerm_linux_virtual_machine.vms : v.name => v.id }
}
