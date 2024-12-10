variable "msg" {
  description = "the msg provided by user"
  type        = string
}

locals {
  computed = "this is an improved `${var.msg}`!!! for user ^^"
}

output "msg" {
  value = local.computed
}
