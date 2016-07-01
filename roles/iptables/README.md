This module needs variables per host of hostgroup.
Default for a loadbalancer would be:

If the loadbalancer is also the gateway:

```yaml
ip4tables:
  nat:
    - '-A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE -m comment --comment "001 snat for VPC network"'
    - '-A PREROUTING -d <vip>/32 -p tcp --dport 2221 -j DNAT --to-destination 10.0.0.20:22 -m comment --comment "101 forward port 2221 to 22 app1"'
    - '-A PREROUTING -d <vip>/32 -p tcp --dport 2222 -j DNAT --to-destination 10.0.0.21:22 -m comment --comment "101 forward port 2222 to 22 app2"'
# For SNMP 
#    - '-A PREROUTING -d <vip>/32 -p udp -m udp --dport 1610 -j DNAT --to-destination 10.0.0.20:161 -m comment --comment "304 forward port 1610 to 10.0.0.20:161"'
#    - '-A PREROUTING -d <vip>/32 -p udp -m udp --dport 1611 -j DNAT --to-destination 10.0.0.21:161 -m comment --comment "304 forward port 1611 to 10.0.0.21:161"'
#    - '-A PREROUTING -d <vip>/32 -p udp -m udp --dport 1612 -j DNAT --to-destination 10.0.0.100:161 -m comment --comment "304 forward port 1612 to 10.0.0.100:161"'
#    - '-A PREROUTING -d <vip>/32 -p udp -m udp --dport 1613 -j DNAT --to-destination 10.0.0.110:161 -m comment --comment "304 forward port 1613 to 10.0.0.110:161"' 
  filter:
    - '-A INPUT -p icmp -j ACCEPT -m comment --comment "000 accept all icmp"'
    - '-A INPUT -i lo -j ACCEPT -m comment --comment "001 accept all to lo interface"'
    - '-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT -m comment --comment "002 accept related established rules"'
    - '-A INPUT -p vrrp -j ACCEPT -m comment --comment "003 accept vrrp protocol"'
    - '-A INPUT -d 224.0.0.0/8 -j ACCEPT -m comment --comment "003 accept multicast protocol"'
```

If the gateway is not on the same server (OpenStack):

```yaml
ip4tables:
  nat:
    - '-A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE -m comment --comment "001 snat for VPC network"'
    - '-A PREROUTING -d <vip>/32 -p tcp --dport 2221 -j DNAT --to-destination 10.0.0.20:22 -m comment --comment "101 forward port 2221 to 22 app1"'
    - '-A PREROUTING -d <vip>/32 -p tcp --dport 2222 -j DNAT --to-destination 10.0.0.21:22 -m comment --comment "101 forward port 2222 to 22 app2"'
# For SNMP 
#   - '-A PREROUTING -d <vip>/32 -p udp -m udp --dport 1610 -j DNAT --to-destination 10.0.0.20:161 -m comment --comment "161 app1 forward port 1610 to 10.0.0.20:161"'
#   - '-A POSTROUTING -d 10.0.0.20/32 -p udp -j SNAT --to-source <vip> -m comment --comment "160 app1 source-ip set to <vip>"'
#   - '-A PREROUTING -d <vip>/32 -p udp -m udp --dport 1611 -j DNAT --to-destination 10.0.0.21:161 -m comment --comment "161 app2 forward port 1611 to 10.0.0.21:161"'
#   - '-A POSTROUTING -d 10.0.0.21/32 -p udp -j SNAT --to-source <vip> -m comment --comment "160 app2 source-ip set to <vip>"'
  filter:
    - '-A INPUT -p icmp -j ACCEPT -m comment --comment "000 accept all icmp"'
    - '-A INPUT -i lo -j ACCEPT -m comment --comment "001 accept all to lo interface"'
    - '-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT -m comment --comment "002 accept related established rules"'
    - '-A INPUT -p vrrp -j ACCEPT -m comment --comment "003 accept vrrp protocol"'
    - '-A INPUT -d 224.0.0.0/8 -j ACCEPT -m comment --comment "003 accept multicast protocol"'
```