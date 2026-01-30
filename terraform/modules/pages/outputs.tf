output "project_id" {
  description = "CloudFlare Pages project ID"
  value       = cloudflare_pages_project.main.id
}

output "project_name" {
  description = "CloudFlare Pages project name"
  value       = cloudflare_pages_project.main.name
}

output "deployment_url" {
  description = "CloudFlare Pages deployment URL"
  value       = "https://${var.project_name}.pages.dev"
}

output "subdomain" {
  description = "CloudFlare Pages subdomain"
  value       = cloudflare_pages_project.main.subdomain
}
