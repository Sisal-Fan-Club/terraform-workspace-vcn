output "vcn" {
  value = local.vcn
  
  sensitive = true
}

output "internet_gateway" {
  value = local.internet_gw
  
  sensitive = true
}

output "dmz_route_table" {
  value = local.dmz_route_table
  
  sensitive = true
}

output "nat_gateway" {
  value = local.internet_gw
  
  sensitive = true
}

output "app_route_table" {
  value = local.app_route_table
  
  sensitive = true
}
