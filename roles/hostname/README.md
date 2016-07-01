# Role hostname

Sets the system hostname to hostname defined in var file.

# Usage

Inlcude in your playbook like this:

```yaml
- hosts: all
  roles: 
    - hostname
```
Include in your host_vars or your group_vars.
The below example is default:

```yaml
hostname:
  name: my_hostname_tld
```

# Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`hostname`|string|server hostname|``
