# Role snmp

This role will install the snmp daemon.

## Role variables

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`community`|String|SNMP community|`rocommunity`
`systemlocation`|String|Location of the system|`CLOUDVPS CLOUD`
`systemcontact`|String|System contact email|`support@cloudpvps.com`
`monitor`|String|IP from the SNMP agent|`79.170.89.58`

## Usage

Set in group_vars/ or host_vars/

```yaml
snmp:
  community: rocommunity
  systemlocation: CLOUDVPS CLOUD
  systemcontact: support@cloudpvps.com
  monitor: 79.170.89.58
```

Include in roles like this:

```yaml
- hosts: all
  roles:
   - snmp
```

