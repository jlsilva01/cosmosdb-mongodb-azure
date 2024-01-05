# Show endpoint cosmosdb
output "cosmosdb_endpoint" {
  description = "Endpoint do CosmosDB"
  value       = azurerm_cosmosdb_account.cosmosdb.endpoint
}

# port number
output "cosmosdb_version" {
  description = "Versão do CosmosDB"
  value       = azurerm_cosmosdb_account.cosmosdb.mongo_server_version
}

# Show connection string cosmosdb
output "cosmosdb_connection_strings" {
  description = "Connection string do CosmosDB"
  value       = azurerm_cosmosdb_account.cosmosdb.connection_strings
  sensitive   = true
}

# Show primary keys cosmosdb
output "cosmosdb_primary_master_key" {
  description = "Primary master key do CosmosDB"
  value       = azurerm_cosmosdb_account.cosmosdb.primary_key
  sensitive   = true
}

# Show primary keys cosmosdb
output "cosmosdb_primary_mongodb_connection_string" {
  description = "Primary Connection String do CosmosDB"
  value       = azurerm_cosmosdb_account.cosmosdb.primary_mongodb_connection_string
  sensitive   = true
}