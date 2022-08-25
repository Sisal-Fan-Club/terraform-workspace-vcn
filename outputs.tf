output "vcn" {
  value = local.vcn
  
  sensitive = true
}

output "internet_gateway" {
  value = local.internet_gw
  
  sensitive = true
}
