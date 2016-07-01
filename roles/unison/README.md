This role needs variables per host in host_vars/*
Add the role like this:

```yaml
- hosts: all
  roles: 
    - unison
```

Example for master host:

```yaml
unison:
  state: master
  syncjob:
    - name: 'default'
      slave_ip: '10.0.0.21'
      slave_dir: '/var/www/'
      master_dir: '/var/www/'
    - name: 'user'
      slave_ip: '10.0.0.21'
      slave_dir: '/home/user/domains/public_html/'
      master_dir: '/home/user/domains/public_html/'
```

Example for slave host:

```yaml
unison:
  state: slave
```

If nothing is set, the module will just intall
Unison with no configuration.