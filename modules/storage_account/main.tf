resource "azurerm_storage_account" "this" {
  name                = var.storage_account_name        
  resource_group_name = var.resource_group_name        
  location            = var.location                    
  account_tier             = "Standard"                  # Performance tier: Standard (HDD, cheaper) vs Premium (SSD, faster)
  account_replication_type = "LRS"                       # How data is copied for redundancy — LRS = 3 copies in one datacenter
  account_kind = "StorageV2"                             # General-purpose v2 account — supports blobs, files, queues, tables
  access_tier = "Hot"                                    # Optimized for frequently accessed data (costs more to store, cheaper to access)
  https_traffic_only_enabled = true                      # Blocks plain HTTP — only encrypted HTTPS connections allowed
  min_tls_version = "TLS1_2"                              # Rejects old, insecure TLS versions — only TLS 1.2+ allowed
  public_network_access_enabled = true                   # Storage account can be reached over the public internet
  allow_nested_items_to_be_public = false                # Prevents any container/blob inside from ever being made publicly readable
  tags = var.tags                                        # Custom labels for organizing
}

resource "azurerm_storage_container" "function_code" {
  name                  = var.container_name             
  storage_account_id    = azurerm_storage_account.this.id # Links this container to the storage account created above
  container_access_type = "private"                      # No anonymous access — requires authentication (keys/SAS) to read/write
}