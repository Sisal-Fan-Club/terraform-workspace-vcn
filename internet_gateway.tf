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
