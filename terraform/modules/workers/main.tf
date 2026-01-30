# CloudFlare Worker Script
resource "cloudflare_worker_script" "main" {
  account_id = var.account_id
  name       = var.worker_name
  content    = file(var.worker_script)

  # Plain text environment variables
  dynamic "plain_text_binding" {
    for_each = var.environment_variables
    content {
      name = plain_text_binding.key
      text = plain_text_binding.value
    }
  }

  # Secret text bindings
  dynamic "secret_text_binding" {
    for_each = var.secrets
    content {
      name = secret_text_binding.key
      text = secret_text_binding.value
    }
  }

  # KV namespace bindings
  dynamic "kv_namespace_binding" {
    for_each = { for idx, ns in cloudflare_workers_kv_namespace.kv : ns.title => ns }
    content {
      name         = kv_namespace_binding.key
      namespace_id = kv_namespace_binding.value.id
    }
  }
}

# KV Namespaces
resource "cloudflare_workers_kv_namespace" "kv" {
  for_each = { for ns in var.kv_namespaces : ns.name => ns }

  account_id = var.account_id
  title      = each.value.name
}

# Worker Routes
resource "cloudflare_worker_route" "routes" {
  for_each = { for idx, route in var.worker_routes : idx => route }

  zone_id     = each.value.zone_id
  pattern     = each.value.pattern
  script_name = cloudflare_worker_script.main.name
}
