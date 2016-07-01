# Role dnsmasq

Dnsmasq is a lightweight, easy to configure DNS forwarder and DHCP server. It is designed to provide DNS and, optionally, DHCP, to a small network. It can serve the names of local machines which are not in the global DNS. The DHCP server integrates with the DNS server and allows machines with DHCP-allocated addresses to appear in the DNS with names configured either in each host or in a central configuration file. Dnsmasq supports static and dynamic DHCP leases and BOOTP/TFTP/PXE for network booting of diskless machines.

# Usage

Inlcude in your playbook like this:

```yaml
- hosts: all
  roles: 
    - dnsmasq
```
Include in your host_vars or your group_vars.
The below example is default:

```yaml
dnsmasq:
  listen_interface: eth1
  listen_address: 10.0.0.1
```

# Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`listen_interface`|string|interface to listen to|`eth1`
`listen_address`|string|address to listen on|`10.0.0.1`





