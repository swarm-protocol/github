# CloudFlare Account Information
output "account_id" {
  description = "CloudFlare account ID"
  value       = data.cloudflare_accounts.main.accounts[0].id
}

# Workers Outputs
output "worker_id" {
  description = "CloudFlare Worker ID"
  value       = var.deploy_workers ? module.workers[0].worker_id : null
}

output "worker_url" {
  description = "CloudFlare Worker URL"
  value       = var.deploy_workers ? module.workers[0].worker_url : null
}

output "kv_namespace_ids" {
  description = "KV namespace IDs"
  value       = var.deploy_workers ? module.workers[0].kv_namespace_ids : {}
}

# Pages Outputs
output "pages_project_id" {
  description = "CloudFlare Pages project ID"
  value       = var.deploy_pages ? module.pages[0].project_id : null
}

output "pages_deployment_url" {
  description = "CloudFlare Pages deployment URL"
  value       = var.deploy_pages ? module.pages[0].deployment_url : null
}

# DNS Outputs
output "dns_record_ids" {
  description = "CloudFlare DNS record IDs"
  value       = var.deploy_dns && var.zone_name != "" ? module.dns[0].record_ids : {}
}

output "zone_id" {
  description = "CloudFlare zone ID"
  value       = var.zone_name != "" ? data.cloudflare_zone.main[0].id : null
}
