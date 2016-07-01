# Role denyhosts

Install the denyhost package and set whitelist IP's
for SSH and reasonable defaults.

# Usage:

Inlcude in your playbook like this:

```yaml
- hosts: all
  roles:
    - denyhosts
```

Include in your host_vars or your group_vars.
The below example is default:

```yaml
whitelist:
  - 127.0.0.1
  - 79.170.89.58
  - 79.170.89.59
  - 194.60.207.22
```
