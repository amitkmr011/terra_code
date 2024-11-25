module "module-rg" {
  source = "../../modules/azurerm-rgs"
  rgs = var.dev-rgs
}

module "module-stgs" {
    depends_on = [ module.module-rg ]
  source = "../../modules/azurerm-stgs"
  stgs =  var.dev-stgs
}