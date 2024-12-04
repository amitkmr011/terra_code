terraform{
    required_providers{
azurerm={
    source="hashicorp/azurerm"
    version="4.10.0"
}
}
#  backend "azurerm" {
#     resource_group_name  = "dushyrg"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
#     storage_account_name = "randomsto"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
#     container_name       = "terenamm"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
#     key                  = "terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    
#   }

}


provider"azurerm"{
    features{}
    subscription_id="1d94d08b-e5d6-4ac8-a148-ebfdbe3aaa1a"
}