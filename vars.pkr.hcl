variable "password" {
  sensitive = true
  default   = "#pi@12345"
}

variable "user" {
  type    = string
  default = "pi"
}