dev-rgs = {
  rg1={
    name ="Sanidhya"
    location="westeurope"
  }
   rg2={
    name ="vats"
    location="westeurope"
    tags={environment="dev"}
  }
}

dev-stgs = {
  stg1={
    name="sanidhyastoragevats"
    resource_group_name="Sanidhya"
    location="westeurope"
    account_replication_type="LRS"
    account_tier="Standard"
    
}}