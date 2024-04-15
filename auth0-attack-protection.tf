resource "auth0_attack_protection" "my_protection" {
  for_each = { for k, v in var.attack_protections : k => v }

  dynamic "suspicious_ip_throttling" {
    for_each = contains(keys(each.value), "suspicious_ip_throttling") ? [1] : []
    content {
      enabled   = var.attack_protections[each.key].suspicious_ip_throttling.enabled
      shields   = var.attack_protections[each.key].suspicious_ip_throttling.shields
      allowlist = var.attack_protections[each.key].suspicious_ip_throttling.allowlist

      pre_login {
        max_attempts = var.attack_protections[each.key].suspicious_ip_throttling.pre_login.max_attempts
        rate         = var.attack_protections[each.key].suspicious_ip_throttling.pre_login.rate
      }

      pre_user_registration {
        max_attempts = var.attack_protections[each.key].suspicious_ip_throttling.pre_user_registration.max_attempts
        rate         = var.attack_protections[each.key].suspicious_ip_throttling.pre_user_registration.rate
      }
    }
  }


  dynamic "brute_force_protection" {
    for_each = contains(keys(each.value), "brute_force_protection") ? [1] : []

    content {
      allowlist    = var.attack_protections[each.key].brute_force_protection.allowlist
      enabled      = var.attack_protections[each.key].brute_force_protection.enabled
      max_attempts = var.attack_protections[each.key].brute_force_protection.max_attempts
      mode         = var.attack_protections[each.key].brute_force_protection.mode
      shields      = var.attack_protections[each.key].brute_force_protection.shields
    }
  }

  dynamic "breached_password_detection" {
    for_each = contains(keys(each.value), "breached_password_detection") ? [1] : []
    content {
      admin_notification_frequency = var.attack_protections[each.key].breached_password_detection.admin_notification_frequency
      enabled                      = var.attack_protections[each.key].breached_password_detection.enabled
      method                       = var.attack_protections[each.key].breached_password_detection.method
      shields                      = var.attack_protections[each.key].breached_password_detection.shields

      pre_user_registration {
        shields = var.attack_protections[each.key].breached_password_detection.pre_user_registration.shields
      }

    }
  }

}