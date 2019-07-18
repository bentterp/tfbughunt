resource "azurerm_resource_group" "myrg" {
  for_each = var.mymap
  name     = each.key
  location = "westeurope"
  tags = merge({"Description" = each.value})
}
