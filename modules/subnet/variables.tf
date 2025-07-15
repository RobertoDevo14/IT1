variable "subnets" {
  default = [
    {
      name       = ""
      cidr_block = ""
    }
  ]
}
variable "vnet_name" {
}
variable "rsg_name" {
}
variable "nsg_id" {
}
# variable "nsg_idbe" {
# }
variable "nsg_idcl" {
}
variable "module_depends_on" {
  default = [""]
}