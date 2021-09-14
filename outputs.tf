##############################################################################
# VPC GUID
##############################################################################

output vpc_id {
  description = "ID of VPC created"
  value       = ibm_is_vpc.vpc.id
}

output acl_id {
  description = "ID of ACL created for subnets"
  value       = ibm_is_network_acl.multizone_acl
}

output public_gateways {
  description = "Public gateways created"
  value       = local.public_gateways
}

##############################################################################

##############################################################################
# Subnet Outputs
# Copyright 2020 IBM
##############################################################################

output subnet_ids {
  description = "The IDs of the subnets"
  value       = module.subnets.ids
}

output subnet_detail_list {
  description = "A list of subnets containing names, CIDR blocks, and zones."
  value       = module.subnets.detail_list
}

output subnet_zone_list {
  description = "A list containing subnet IDs and subnet zones"
  value       = module.subnets.zone_list
}

##############################################################################