# CloudFlare Pages Module

variable "account_id" {
  description = "CloudFlare account ID"
  type        = string
}

variable "project_name" {
  description = "Name of the Pages project"
  type        = string
}

variable "production_branch" {
  description = "Production branch"
  type        = string
  default     = "main"
}

variable "build_command" {
  description = "Build command"
  type        = string
  default     = "npm run build"
}

variable "destination_dir" {
  description = "Output directory"
  type        = string
  default     = "dist"
}

variable "root_dir" {
  description = "Root directory"
  type        = string
  default     = ""
}

variable "environment_variables" {
  description = "Environment variables"
  type        = map(string)
  default     = {}
}
