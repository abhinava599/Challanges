data "azurerm_key_vault" "keyvault" {
  name                = "Challange1_KV"
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