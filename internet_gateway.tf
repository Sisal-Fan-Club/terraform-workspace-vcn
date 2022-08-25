locals {
  internet_gw = oci_core_internet_gateway.internet_gateway
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = local.vcn.compartment_id
  vcn_id = local.vcn.id
  
  display_name = "Internet Gateway to expose public IPs (DNAT)"
  
  freeform_tags = merge({
    sercurity-profile = "dmz"
  }, local.vcn.freeform_tags)
}

resource "oci_core_route_table" "internet_gateway" {
  compartment_id = local.internet_gw.compartment_id
  vcn_id = local.internet_gw.vcn_id
  
  display_name = local.internet_gw.display_name
  
  route_rules {
    
    description = "Default route via Internet Gateway"
    network_entity_id = local.internet_gw.id
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
  
  freeform_tags = merge({
  }, local.internet_gw.freeform_tags)
}
