output "worker_id" {
  description = "CloudFlare Worker ID"
  value       = cloudflare_worker_script.main.id
}

output "worker_url" {
  description = "CloudFlare Worker URL"
  value       = "https://${var.worker_name}.workers.dev"
}

output "kv_namespace_ids" {
  description = "KV namespace IDs"
  value       = { for k, v in cloudflare_workers_kv_namespace.kv : k => v.id }
}

output "worker_routes" {
  description = "Worker route IDs"
  value       = { for k, v in cloudflare_worker_route.routes : k => v.id }
}
