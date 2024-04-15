resource "auth0_prompt" "my_prompt" {
  for_each = { for k, v in var.prompts : k => v }

  identifier_first               = each.value.identifier_first
  universal_login_experience     = each.value.universal_login_experience
  webauthn_platform_first_factor = each.value.webauthn_platform_first_factor
}

resource "auth0_prompt_custom_text" "my_prompt_custom_text" {
  for_each = { for k, v in var.prompt_custom_texts : k => v }
  body     = each.value.body
  language = each.value.language
  prompt   = each.value.prompt
}