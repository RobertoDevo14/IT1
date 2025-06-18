#---------------------------------------------------------
# Public IP Creation or selection
#---------------------------------------------------------

resource "azurerm_public_ip" "publicip" {
  name                = var.ippublic_name
  location            = var.location
  resource_group_name = var.rsg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

#---------------------------------------------------------
# Application Gateway Creation or selection
#---------------------------------------------------------

resource "azurerm_application_gateway" "main" {
  name                = var.appgw_name
  location            = var.location
  resource_group_name = var.rsg_name

  sku {
    name     = var.sku
    tier     = var.sku
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.vnet_subnet_id
  }

  frontend_port {
    name = "httpPort"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontendipcfg"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }

  backend_address_pool {
    name = "defaultaddresspool"
  }

  backend_http_settings {
    name                  = "defaulthttpsetting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }

  http_listener {
    name                           = "httplistener"
    frontend_ip_configuration_name = "frontendipcfg"
    frontend_port_name             = "httpPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "requestroutingrule"
    rule_type                  = "Basic"
    http_listener_name         = "httplistener"
    backend_address_pool_name  = "defaultaddresspool"
    backend_http_settings_name = "defaulthttpsetting"
  }

  dynamic "waf_configuration" {
    for_each = (var.waf_enabled && contains(["WAF", "WAF_v2"], var.sku)) ? [true] : []
    content {
      enabled          = var.waf_enabled
      firewall_mode    = var.waf_firewall_mode
      rule_set_type    = "OWASP"
      rule_set_version = "3.1"
    }
  }
}
