# CloudFlare Workers Module

variable "account_id" {
  description = "CloudFlare account ID"
  type        = string
}

variable "worker_name" {
  description = "Name of the CloudFlare Worker"
  type        = string
}

variable "worker_script" {
  description = "Path to the worker script"
  type        = string
}

variable "worker_routes" {
  description = "Routes to attach to the worker"
  type = list(object({
    pattern = string
    zone_id = string
  }))
  default = []
}

variable "kv_namespaces" {
  description = "KV namespaces to create"
  type = list(object({
    name = string
  }))
  default = []
}

variable "environment_variables" {
  description = "Environment variables for the worker"
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "Secret environment variables"
  type        = map(string)
  sensitive   = true
  default     = {}
}
