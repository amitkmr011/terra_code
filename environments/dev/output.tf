output "rgs-name-id" {
  value = module.module-rg.rgs-ids
}
# output "stgs-name-id" {
#   value = module.module-stgs.stgs-ids
# }
output "vm-public-ip" {
  value = module.vm-module.vm-public-ip
}

output "vnet-ids-space" {
  value = module.module-vnets.vnet-ids-space
}