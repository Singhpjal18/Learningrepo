RGs = {

  Rg1 = {
    resource_group_name  = "WorkspaceRG"
    location = "East US"

  }
}

PIP = {
  PIP1 = {
    name                = "PIP-WorkspaceVnet"
    resource_group_name = "WorkspaceRG"
    location            = "East US"
    allocation_method   = "Static"
  }
}
Vnet = {
  Vnet1 = {
    name                = "WorkspaceVnet"
    location            = "East US"
    resource_group_name = "WorkspaceRG"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name          = "worksubnet1"
    resource_group_name  = "WorkspaceRG"
    virtual_network_name = "WorkspaceVnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name          = "worksubnet2"
    resource_group_name  = "WorkspaceRG"
    virtual_network_name = "WorkspaceVnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

Vms = {
  Vm1 = {
    NIC_Name                        = "WorkVM1NIC"
    vm_name                         = "WorkVM1"
    location                        = "East US"
    ip_configuration_name           = "Internal"
    private_ip_address_allocation   = "dynamic"
    public_ip_name                  = "PIP-WorkspaceVnet"
    virtual_network_name            = "WorkspaceVnet"
    subnet_name                     = "worksubnet1"
    resource_group_name             = "WorkspaceRG"
    vm_size                         = "Standard_D4_v5"
    admin_username                  = "adminuser1"
    admin_password                  = "adminuser1"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
  Vm2 = {
    NIC_Name                        = "WorkVM2NIC"
    vm_name                         = "WorkVM2"
    location                        = "East US"
    ip_configuration_name           = "Internal"
    private_ip_address_allocation   = "dynamic"
    public_ip_name                  = "PIP-WorkspaceVnet"
    virtual_network_name            = "WorkspaceVnet"
    subnet_name                     = "worksubnet2"
    resource_group_name             = "WorkspaceRG"
    vm_size                         = "Standard_D4_v5"
    admin_username                  = "adminuser2"
    admin_password                  = "adminuser2"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }


}

