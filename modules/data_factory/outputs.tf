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