resource "azurerm_key_vault" "this" {
  name = local.key_vault_name
  location = var.location
  resource_group_name = var.resource_group_name

  # Microsoft Entra ID Tenant ID.
  # Defines which Azure AD tenant manages authentication and access to this Key Vault.
  tenant_id = var.tenant_id


  # Pricing tier of the Key Vault.Standard supports secrets, keys, and certificates.
  sku_name = "standard"

  # Number of days deleted secrets/keys/certificates are retained before permanent deletion.
  # Allows recovery of accidentally deleted items.
  soft_delete_retention_days = 90


  # Prevents permanent deletion (purging) of the Key Vault before the retention period expires.
  purge_protection_enabled = true


  # Controls whether the Key Vault can be accessed through the public internet.
  # true  = Public access allowed
  # false = Requires private endpoint/private networking
  public_network_access_enabled = true

  tags = var.tags
}