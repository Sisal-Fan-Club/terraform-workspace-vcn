locals {
  nat_gateway = oci_core_nat_gateway.nat_gateway
  app_route_table = oci_core_route_table.nat_gateway
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = local.vcn.compartment_id
  vcn_id = local.vcn.id
  
  display_name = "NAT Gateway to go on Internet (SNAT)"

  freeform_tags = merge({
    sercurity-profile = "app"
  }, local.vcn.freeform_tags)
}

resource "oci_core_route_table" "nat_gateway" {
  compartment_id = local.nat_gateway.compartment_id
  vcn_id = local.nat_gateway.vcn_id
  
  display_name = local.nat_gateway.display_name
  
  route_rules {
    
    description = "Default route via NAT Gateway"
    network_entity_id = local.nat_gateway.id
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
  
  freeform_tags = merge({
  }, local.nat_gateway.freeform_tags)
}
