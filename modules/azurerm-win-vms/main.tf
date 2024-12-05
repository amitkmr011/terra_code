resource "azurerm_public_ip" "pips" {
    for_each = var.vms
  name                ="${each.value.vm_name}-nic"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}
resource "azurerm_network_interface" "nics" {
    for_each = var.vms
  name                = "${each.value.vm_name}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "${each.value.vm_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.sub-data[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = azurerm_public_ip.pips[each.key].id
  }
}



resource "azurerm_windows_virtual_machine" "vms" {
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                =  each.value.size
  admin_username      = each.value.admin_username
  admin_password      =  each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id,
  ]

  os_disk {
    caching              =  each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher =  each.value.publisher
    offer     =  each.value.offer
    sku       =  each.value.sku
    version   =  each.value.version
  }
}