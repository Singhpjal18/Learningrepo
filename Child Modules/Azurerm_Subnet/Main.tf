resource "azurerm_subnet" "subnets" {
  for_each = var.subnets
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  name = each.value.subnet_name
  address_prefixes = each.value.address_prefixes
}