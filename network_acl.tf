##############################################################################
# Network ACL
##############################################################################

resource ibm_is_network_acl multizone_acl {
      name           = "${var.prefix}-acl"
      vpc            = ibm_is_vpc.vpc.id
      resource_group = data.ibm_resource_group.resource_group.id

      # Create ACL rules
      dynamic rules {
            for_each = var.acl_rules
            content {
                  name        = rules.value.name
                  action      = rules.value.action
                  source      = rules.value.source
                  destination = rules.value.destination
                  direction   = rules.value.direction

                  dynamic tcp {
                        for_each = rules.value.tcp == null ? [] : [rules.value]
                        content {
                              port_min        = rules.value.tcp.port_min
                              port_max        = rules.value.tcp.port_max
                              source_port_min = rules.value.tcp.source_port_min
                              source_port_max = rules.value.tcp.source_port_min
                        }
                  } 

                  dynamic udp {
                        for_each = rules.value.udp == null ? [] : [rules.value]
                        content {
                              port_min        = rules.value.udp.port_min
                              port_max        = rules.value.udp.port_max
                              source_port_min = rules.value.udp.source_port_min
                              source_port_max = rules.value.udp.source_port_min
                        }
                  } 

                  dynamic icmp {
                        for_each = rules.value.icmp == null ? [] : [rules.value]
                        content {
                              type = rules.value.icmp.type
                              code = rules.value.icmp.code
                        }
                  } 
            }
      }
}

##############################################################################