
dev-rgs = {
  rg1 = {
    name     = "Mahendra"
    location = "westeurope"
  }
  rg2 = {
    name     = "Vats"
    location = "westeurope"
    tags     = { environment = "dev" }
  }
  rg3 = {
    name     = "Sanidhya1"
    location = "westeurope"
    tags     = { environment = "dev" }
  }

}


dev-stgs = {
  stg1 = {
    name                     = "sanidhyastoragevats"
    resource_group_name      = "Sanidhya1"
    location                 = "westeurope"
    account_replication_type = "LRS"
    account_tier             = "Standard"

  }
  stg2 = {
    name                     = "sanidhyastoragevats1"
    resource_group_name      = "vats"
    location                 = "westeurope"
    account_replication_type = "LRS"
    account_tier             = "Standard"

} }

dev-cons = {
  con1 = {
    name                 = "sanidhyaconatiner"
    storage_account_name = "sanidhyastoragevats"
    resource_group_name  = "Sanidhya1"
  }
  con2 = {
    name                 = "sanidhyaconatiner1"
    storage_account_name = "sanidhyastoragevats1"
    resource_group_name  = "vats"
  }
}

dev-vnets = {
  vnet1 = {
    name                = "vnet"
    location            = "Central india"
    resource_group_name = "Sanidhya1"
    address_space       = ["10.0.0.0/24"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    subnets = {
       subnet1 = {

      name             = "floor1"
      address_prefixes = ["10.0.0.0/28"]
      }
      subnet2 = {

        name             = "floor2"
        address_prefixes = ["10.0.0.16/28"]
      }
      subnet3 = {

        name             = "floor3"
        address_prefixes = ["10.0.0.32/27"]
    } }

  }
  vnet2 = {
    name                = "vnet1"
    location            = "Central india"
    resource_group_name = "Sanidhya1"
    address_space       = ["10.0.1.0/24"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    subnets={
       subnet1 = {

      name             = "floor1"
      address_prefixes = ["10.0.1.0/28"]
      }
      subnet2 = {

        name             = "floor2"
        address_prefixes = ["10.0.1.16/28"]
      }
      subnet3 = {

        name             = "floor3"
        address_prefixes = ["10.0.1.32/27"]
    } }

  }
}


dev-win-vms = {
  vm1={
    vm_name= "Sanidhyavm"
    resource_group_name="Sanidhya1"
    location="Central india"
    size="Standard_F2"
    admin_username="sanidhya"
    admin_password="Sanidhya@123"
    caching="ReadWrite"
    storage_account_type="Standard_LRS"
    publisher= "MicrosoftWindowsServer"
    offer= "WindowsServer"
    sku="2016-Datacenter"
    version= "latest"
    private_ip_address_allocation="Dynamic"
    subnet_name="floor1"
     virtual_network_name= "vnet"
     allocation_method="Static"
     nsg_name="Sanidhyavm-nsg"
     asgs_name="AppWeb"
  }
   vm2={
    vm_name= "Sanidhyavm1"
    resource_group_name="Sanidhya1"
    location="Central india"
    size="Standard_B1s"
    admin_username="sanidhya"
    admin_password="Sanidhya@123"
    caching="ReadWrite"
    storage_account_type="Standard_LRS"
    publisher= "MicrosoftWindowsServer"
    offer= "WindowsServer"
    sku="2016-Datacenter"
    version= "latest"
    private_ip_address_allocation="Dynamic"
    subnet_name="floor1"
     virtual_network_name= "vnet"
     allocation_method="Static"
     nsg_name="Sanidhyavm-nsg"
     asgs_name="AppWeb"
  }
  vm3={
    vm_name= "Sanidhyavm2"
    resource_group_name="Sanidhya1"
    location="Central india"
    size="Standard_B1s"
    admin_username="sanidhya"
    admin_password="Sanidhya@123"
    caching="ReadWrite"
    storage_account_type="Standard_LRS"
    publisher= "MicrosoftWindowsServer"
    offer= "WindowsServer"
    sku="2016-Datacenter"
    version= "latest"
    private_ip_address_allocation="Dynamic"
    subnet_name="floor2"
     virtual_network_name= "vnet"
     allocation_method="Static"
     nsg_name="Sanidhyavm-nsg"
     asgs_name="AppLogic"
  }
}

dev-nsgs={
  nsg1={
    name="Sanidhyavm-nsg"
    resource_group_name="Sanidhya1"
    location="centralindia"
    security_rules={
      rule1={
          name                       = "RDPAllow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range        = "*"
    destination_port_range     = "3389"
    source_address_prefix     ="*"
    destination_address_prefix = "*"
      }
      rule2={
          name                       = "RDPDeny"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range        = "*"
    destination_port_range     ="3389"
    source_address_prefix    ="*"
    destination_address_prefix= "*"
      }
    }
  }
}
dev-asgs = {
  asgs1={
    name="AppWeb"
    location="central India"
    resource_group_name="Sanidhya1"
  }
  asgs2={
    name="AppLogic"
    location="central India"
    resource_group_name="Sanidhya1"
  }
}