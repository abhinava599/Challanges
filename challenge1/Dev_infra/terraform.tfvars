rgs = {
  rg-dev-challenge1 = {
    location = "West Europe"
  }
}

vnets_subnets = {
  vnet-challenge1 = {
    location            = "West Europe"
    resource_group_name = "rg-dev-challenge1"
    address_space       = ["10.0.0.0/16"]
    # The AzureBastionSubnet Block is required in subnets if enable_bastion=true 
    # AzureBastionSubnet = {
    #     address_prefix = "10.0.2.0/24"
    # }
    enable_bastion = true
    subnets = {
      frontend-subnet = {
        address_prefix = "10.0.0.0/24"
      }
      backend-subnet = {
        address_prefix = "10.0.1.0/24"
      }
      AzureBastionSubnet = {
        address_prefix = "10.0.2.0/24"
      }
    }
  }
}

key_vault = {
  "kv1" = {
    name = "challengekv"
    location ="West Europe"
    resource_group_name = "rg-dev-challenge1"

  }
}

vms = {
  "frontendvm" = {
    resource_group_name = "rg-dev-challenge1"
    location            = "West Europe"
    vnet_name           = "vnet-challenge1"
    subnet_name         = "frontend-subnet"
    size                = "Standard_DS1_v2"
    inbound_open_ports  = [22, 80]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = false
  }
  "backendvm" = {
    resource_group_name = "rg-dev-challenge1"
    location            = "West Europe"
    vnet_name           = "vnet-challenge1"
    subnet_name         = "backend-subnet"
    size                = "Standard_DS1_v2"
    inbound_open_ports  = [22, 80]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = false
  }
}


loadbalancers = {
  lb-challenge1 = {
    location                       = "West Europe"
    resource_group_name            = "rg-dev-challenge1"
    frontend_ip_configuration_name = "PublicIPAddress"
    sku                            = "Standard"
  }
}

backend_pools = {
  frontend-pool = {
    port        = 80
    lb_name     = "lb-challenge1"
    backend_vms = ["frontendvm", "backendvm"]
  }
}

servers_dbs = {
  "challenge1srv1" = {
    resource_group_name          = "rg-dev-challenge1"
    location                     = "West Europe"
    version                      = "12.0"
    administrator_login          = "devopsadmin"
    administrator_login_password = "P@ssw01rd@123"
    dbs                          = ["appdb"]
  }
}