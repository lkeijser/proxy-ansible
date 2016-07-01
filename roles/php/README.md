# Role PHP

This installs the PHP roles.

## Requirements

* None

## Supported system

* Ubuntu 12.04

## Installation

No extra steps needed.

## Usage

Default: 
```yaml
- hosts: hostname
  roles: 
    - {role: php, apache_mod_php: True}
```

If you want to manage the php ini template yourself (ex: /etc/php5/apache2/php.ini):

```yaml
- { role: php, apache_mod_php: True, php_ini_external_template: "{{ target_environment }}/files/appserver/php/php.ini.j2" }
```

If you want to include a custom php ini file (ex: /etc/php5/apache2/conf.d/30-custom-php.ini):

```yaml
- { role: php, apache_mod_php: True, custom_php_ini_file: "{{ target_environment }}/files/appserver/php/custom-ini.yml" }
```

## Role Variables

|Name|Type|Description|Default|
|----|----|-----------|-------|
`apache_mod_php`|bool|enable apache php module|`False`
`custom_php_ini_file`|file|Option to include a cutom php ini file|`False`
`php_ini_external_template`|Option to manage own php ini template|`False`|

## Files required

You need to have the following files in your playbook `{{ target_environment }}/files/` folder:

* None

## Files optional

You may have the following files in your playbook `{{ target_environment }}/files/` folder:

* appserver/php/custom-ini.yml
* appserver/php/php.ini.j2

## Dependencies

Package dependencies on:

* None

Role dependencies on:

The test depends on the following roles:

* None
