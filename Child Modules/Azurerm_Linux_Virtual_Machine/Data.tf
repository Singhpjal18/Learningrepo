data "azurerm_subnet" "subnets" {
  for_each = var.Vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_resource_group" "rg" {
  for_each = var.Vms

  name = each.value.resource_group_name
}
data "azurerm_public_ip" "PIP" {
  for_each            = { for k, v in var.Vms : k => v if try(v.public_ip_name, null) != null }
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name

}