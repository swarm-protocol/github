output "record_ids" {
  description = "DNS record IDs"
  value       = { for k, v in cloudflare_record.records : k => v.id }
}

output "record_hostnames" {
  description = "DNS record hostnames"
  value       = { for k, v in cloudflare_record.records : k => v.hostname }
}
