# Role apache-vhost

Will create virtual hosts for apache2.

- Create the docroot
- Creates vhost configuration

# Usage

Add in your host_vars/ of group_vars/ the following example:

```yaml
apache_vhost:
  example.com:
    name: www.example.com
    docroot: /home/example/domains/www.example.com/public_html
    webuser: example
    prio: 500
  subdomain.example.com:
    name: subdomain.example.com
    serveraliases:
      - sub-a.example.com
      - sub-b.example.com
    docroot: /home/example/domains/sub.example.com/public_html/
    webuser: example
    prio: 500
```

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - apache-vhost
```

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`name`|string|fqdn|``
`docroot`|string|path documentroot|``
`webuser`|string|docroot owner and group|``
`prio`|int|vhost priority|``
`serveraliases`|hash|Server aliases|``
