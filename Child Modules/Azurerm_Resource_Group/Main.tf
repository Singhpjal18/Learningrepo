resource "azurerm_resource_group" "RGs" {
 for_each = var.RGs
 name = each.value.resource_group_name
 location = each.value.location

}