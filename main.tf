provider "azurerm" {   
  features {}
}

terraform {   
  backend "azurerm" {
    resource_group_name = "terraform_resourceGroup_blobstore"
    storage_account_name = "terraformstorageaccdemo"
    container_name = "tfdemostate"
    key = "terraformt.tfstate"
  }  
}

variable "imagebuild" {
  type        = string  
  description = "Latest image build"
}


resource "azurerm_resource_group" "terraform_demo" {
  name = "terraform_rg_demo"
  location = "Norway East"
}

resource "azurerm_container_group" "terraform_cg_demo"{
  name = "weatherapi"
  location = azurerm_resource_group.terraform_demo.location
  resource_group_name = azurerm_resource_group.terraform_demo.name
  ip_address_type = "Public"
  dns_name_label = "terraformDemoWapi"
  os_type = "Linux"

  container {
    name = "weatherapi"
    image = "kabsoft/weatherapi:${var.imagebuild}"
    cpu = "1"
    memory = "1"

    ports {
      port = 80
      protocol = "TCP"
    }
  }
}