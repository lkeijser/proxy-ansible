# Role apache-modules

Enable of disable apache modules

## Installation 

Include in a role like this:

```yaml
- hosts: all
  role: 
    - { role: apache-modules }
```

This role needs variables in host_vars/ or group_vars/:

```yaml
enable_apache_modules:
  - rewrite
  - ssl

disable_apache_modules:
  - headers
```


Default role variables:

```yaml
enable_apache_modules:
  - rewrite
  - ssl

disable_apache_modules:
  - proxy
```