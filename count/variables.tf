variable "instances"{
    type = list
    default = [ "mongodb" , "catalogue" , "redis" , "user" , "cart" , "mysql" , "shipping" , "rabbitmq" , "payment" , "frontend" ]
}
variable "zone_id" {
  default = "Z0778804XVQJM2KVD12A"
}
variable "domain_name" {
    default = "tsmvr.fun"
}

variable "fruits" {
    type = list(string)
    default = ["apple", "mongo", "pineapple", "mongo", "grapes"]
}

variable "fruits_set" {
    type = set(string)
    default = ["apple", "mongo", "pineapple", "mongo", "grapes"]
}