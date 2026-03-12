# MAP
# variable "instances" {
#     type = map
#     default = {
#         mongodb = "t3.micro"
#         mysql = "t3.small"
#         user = "t3.micro"
#         shipping = "t3.small"
#     }
# }


# this should be converted into set
variable "instances"{
    type = list
    default = ["mongodb" , "catalogue"]
}

variable "zone_id" {
  default = "Z0778804XVQJM2KVD12A"
}
variable "domain_name" {
    default = "tsmvr.fun"
}
