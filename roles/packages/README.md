# Role packages

Will install system OS packages.

## Usage

Add in group_vars/ or host_vars/

```yaml
packages:
  - supervisor
  - beanstalkd
  - git
```

Include in your playbook like this:

```yaml
- hosts: all
  roles:
    - packages
```
