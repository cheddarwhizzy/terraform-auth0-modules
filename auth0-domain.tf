resource "auth0_custom_domain" "my_custom_domain" {
  for_each                = { for k, v in var.custom_domains : v.domain => v }
  custom_client_ip_header = try(each.value.custom_client_ip_header, null)
  domain                  = each.value.domain
  tls_policy              = try(each.value.tls_policy, "recommended")
  type                    = try(each.value.type, "auth0_managed_certs")
}