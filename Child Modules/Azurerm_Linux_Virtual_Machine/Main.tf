resource "azurerm_network_interface" "Vms" {
    for_each = var.Vms
    name = each.value.NIC_Name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    ip_configuration {
      name = each.value.ip_configuration_name
      subnet_id = data.azurerm_subnet.subnets[each.key].id
      private_ip_address_allocation = each.value.private_ip_address_allocation
      public_ip_address_id = try(data.azurerm_public_ip.PIP[each.key].id, null
      )
    }
  }
resource "azurerm_linux_virtual_machine" "Vms" {
    for_each = var.Vms
  name = each.value.vm_name
  resource_group_name = data.azurerm_resource_group.rg[each.key].name  
  location = data.azurerm_resource_group.rg[each.key].location
  size = each.value.vm_size
  network_interface_ids = [azurerm_network_interface.Vms[each.key].id]
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

os_disk {
  caching = each.value.caching
  storage_account_type = each.value.storage_account_type
}
source_image_reference {
  publisher = each.value.publisher
  offer = each.value.offer
  sku = each.value.sku
  version = each.value.version
}
}

