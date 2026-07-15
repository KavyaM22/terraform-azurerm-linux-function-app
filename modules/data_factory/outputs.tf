output "ids" {
  value = {
    for key, adf in azurerm_data_factory.this :
    key => adf.id
  }
}

output "names" {
  value = {
    for key, adf in azurerm_data_factory.this :
    key => adf.name
  }
}

output "principal_ids" {
  value = {
    for key, adf in azurerm_data_factory.this :
    key => adf.identity[0].principal_id
  }
}