variable "CLIENT_ID" {
  type      = string
  sensitive = true
}

variable "SECRET" {
  type      = string
  sensitive = true
}

variable "SUBSCRIPTION_ID" {
  type      = string
  sensitive = true
}
variable "TENANT_ID" {
  type      = string
  sensitive = true
}

variable "resource-group-name" {
  type    = string
  default = ""

}
variable "aks-name" {
  type    = string
  default = ""
}

variable "namespace-name" {
  type = string
}
