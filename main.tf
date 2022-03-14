provider "azurerm" {
    version = "2.99.0"
    features {}
}

resource "azurerm_resource_group" "rg-tf" {
    name = "tfmainrg"
    location = "Southeast Asia"
}

resource "azurerm_container_group" "tfcg" {
  name                  = "weatherapi"
  location              = azurerm_resource_group.rg-tf.location
  resource_group_name   = azurerm_resource_group.rg-tf.name
  ip_address_type       = "public"
  dns_name_label        = "alvctesttfwa"
  os_type               = "Linux"

  container {
    name    = "weatherapi"
    image   = "ngv222/weatherapi"
    cpu     = "1"
    memory  = "1"

    ports {
      port      = 80 
      protocol  = "TCP"
    }

}

}

