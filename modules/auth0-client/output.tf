output "app_name" {
  value = auth0_client.my_client.name
}

output "app_description" {
  value = auth0_client.my_client.description
}

output "app_type" {
  value = auth0_client.my_client.app_type
}

output "client_id" {
  value = auth0_client.my_client.client_id
}

output "client_secret" {
  value     = data.auth0_client.my_client.client_secret
  sensitive = true
}

output "key_length" {
  value = length(keys(var.jwt_configuration))
}

output "jwt_configuration" {
  value = compact(distinct(values(var.jwt_configuration)))
}