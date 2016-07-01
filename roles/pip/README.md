# Role php-modules

Install php modules

## Installation 

Include in a role like this:

```yaml
- hosts: all
  role: 
    - { role: php-modules }
```

This role needs variables in host_vars/ or group_vars/:

```yaml
php_modules:
  - php5-mysql
  - php5-mcrypt

```


Default role variables:

```yaml
php_modules:
  - php5-mysql
  - php5-mcrypt

```