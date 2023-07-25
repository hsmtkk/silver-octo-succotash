resource "random_string" "suffix" {
  length  = 8
  special = false
}

resource "azurerm_container_registry" "registry" {
  location            = var.location
  name                = "registry${random_string.suffix.id}"
  resource_group_name = var.resource_group
  sku                 = "Basic"
}


output "registry_name" {
  value = azurerm_container_registry.registry.name
}
