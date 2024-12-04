
module "module-rg" {
  source = "../../modules/azurerm-rgs"
  rgs    = var.dev-rgs
}

# module "module-stgs" {
#   depends_on = [module.module-rg]
#   source     = "../../modules/azurerm-stgs"
#   stgs       = var.dev-stgs
# }

# module "module-cons" {
#   depends_on = [module.module-stgs]
#   source     = "../../modules/azurerm-con"
#   cons       = var.dev-cons
# }

module "module-vnets" {
  depends_on = [module.module-rg]
  source     = "../../modules/azurerm-vnets"
  vnets      = var.dev-vnets

}

module "vm-module" {
  depends_on = [ module.module-vnets ]
  source = "../../modules/azurerm-win-vms"
  vms=var.dev-vms
}