# Role nrpe

This role wil install the nagios nrpe daemon from the xlis / cloudvps
repository.

## Usage

You can use the variables when including the role.

|Name|Type|Description|Default|
|----|----|-----------|-------|
`nrpe_proxy`|Boolean|Enable nrpe proxy|`False`

Include in a role like this

```yaml
- hosts: nrpehost
  roles: 
    - nrpe
````

If the nrpe host is a loadbalancer for a cluster.

```yaml
- hosts: nrpehost
  roles: 
    - {role: nrpe, nrpe_proxy: true}
```

# Variables

Use in group_var or host_vars like this:
This example are the default settings.

```yaml
nrpe:
  allowed_hosts:
    - 194.60.207.22,
    - 10.0.0.1,
    - 10.0.0.2,
    - 10.0.0.3
```

Don't forget to add a nagios mysql user and to add it to the nagios customer services.cfg file:
```
CREATE USER 'nagios'@'%' IDENTIFIED BY '<password>';
GRANT SUPER ON *.* TO 'nagios'@'%';
FLUSH PRIVILEGES;
```
