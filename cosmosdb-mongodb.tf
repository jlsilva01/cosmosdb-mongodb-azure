resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Criar uma conta do CosmosDB
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "cosmos-db-${random_integer.ri.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"
  mongo_server_version = "4.2"
  
  capabilities {
    name = "DisableRateLimitingResponses"
  }

  capabilities {
    name = "EnableServerless"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = var.location
    failover_priority = 0
    zone_redundant = false
  }
}

 # Obter IP público
data "ipify_ip" "public" {}

# Criar regra de firewall
resource "azurerm_mssql_firewall_rule" "sql" {
  name             = "RegraFWInternet"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = data.ipify_ip.public.ip
  end_ip_address   = data.ipify_ip.public.ip
}
