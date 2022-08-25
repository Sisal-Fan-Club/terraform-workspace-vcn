locals {
  vcn = oci_core_vcn.vcn
  root_compartment = local.tfe_workspace_outputs.root_compartment.root_compartment
}

resource "oci_core_vcn" "vcn" {
  compartment_id = local.root_compartment.id
  
  display_name = "${local.root_compartment.description} - Virtual Cloud Network"
  cidr_blocks = [
    "10.0.0.0/16",
  ]
  
  freeform_tags = merge({
  }, local.root_compartment.freeform_tags)
}
