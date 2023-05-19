provider "azurerm" {   
  features {}
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
    image = "kabsoft/weatherapi"
    cpu = "1"
    memory = "1"

    ports {
      port = 80
      protocol = "TCP"
    }
  }
}