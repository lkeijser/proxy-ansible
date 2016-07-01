# Role munin

A role to install munin. Both client (munin-node) and server components are supported.

Tested on:

 * Ubuntu 12.10
 * Ubuntu 14.04
 * CentOS 6.x
 * CentOS 7.x

## Usage

Include in a playbook:

```yaml
- hosts: all
  roles:
    - munin
```

The munin-server webinterface is served by Apache. A configuration template is provided, but the role also allows for an external template. Use it like this:

```yaml
- hosts: all
  roles:
    - {role: munin, munin_apache_external_template: files/munin/apache.conf.j2 }
```

You need to specify which hosts are allowed to request information from munin-node. Include in ENV/group_vars/all/munin.yml:

```yaml
munin:
  server_ip: 10.20.30.40
```

Please note that this does not include changes to firewall rules.


To specify which node in the environment should act as the munin server, include the following in ENV/host_vars/<munin-server-hostname>/munin.yml:

```yaml
munin_server: true
```

The role also includes an apache configuration template for munin, which among other things controls access to the munin website. To specify which IP's should be allowed, include the following in ENV/group_vars/all/munin.yml:

```yaml
allowed_ip_addresses:
  - 1.2.3.4
  - 10.0.0.0/8
```

If this is not specified, the public IP from CloudVPS jumphost is allowed, as well as localhost.
