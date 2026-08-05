module "RGs" {
  source = "../../Child Modules/Azurerm_Resource_Group"
  RGs    = var.RGs
}

module "PIP" {
  source     = "../../Child Modules/Azurerm_PublicIP"
  PIP        = var.PIP
  depends_on = [module.RGs]

}

module "Vnet" {
  source     = "../../Child Modules/Azurerm_Virtual_Network"
  Vnet       = var.Vnet
  depends_on = [module.RGs, module.PIP]

}

module "subnets" {
  source     = "../../Child Modules/Azurerm_Subnet"
  subnets    = var.subnets
  depends_on = [module.Vnet]

}

module "Vms" {
  source     = "../../Child Modules/Azurerm_Linux_Virtual_Machine"
  Vms        = var.Vms
  depends_on = [module.RGs, module.PIP, module.Vnet, module.subnets]

}

