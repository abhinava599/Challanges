resource "azurerm_network_interface" "nic" {
  for_each            = var.windowsvm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  for_each            = var.windowsvm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.keyvaultsecret1.value
  admin_password      = data.azurerm_key_vault_secret.keyvaultsecret2.value
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}