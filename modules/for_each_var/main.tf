locals {
  mylocalmap = var.mymap
}

resource "azurerm_resource_group" "myrg" {
  for_each = local.mylocalmap
  name     = each.key
  location = "westeurope"
  tags = merge({"Description" = each.value})
}
