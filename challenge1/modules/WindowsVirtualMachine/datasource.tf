data "azurerm_subnet" "subnet" {
  for_each             = var.windowsvm
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault" {
  name                = "Vmuserlogin-Shivam"
  resource_group_name = "Shivam-resourcegroup"
}

data "azurerm_key_vault_secret" "keyvaultsecret1" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
data "azurerm_key_vault_secret" "keyvaultsecret2" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}