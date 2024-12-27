variable "name" {
  type        = string
  description = "Database name"
}

variable "image" {
  type        = string
  description = "The docker image used in the deployment"
}

variable "host" {
  type        = string
  description = "The host where the traffic will be routed"
}

variable "tags" {
  default = {}
  type    = map(string)
}
