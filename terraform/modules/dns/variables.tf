# CloudFlare DNS Module

variable "zone_id" {
  description = "CloudFlare zone ID"
  type        = string
}

variable "dns_records" {
  description = "DNS records to create"
  type = list(object({
    name    = string
    type    = string
    value   = string
    ttl     = number
    proxied = bool
  }))
  default = []
}
