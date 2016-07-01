# Role user

A role to create users.

## Usage

Include in role:

```yaml
- hosts: all
  role:
    - user
  
```

In group_vars or host_vars:

```yaml
user:
  - name: piet
    password: "(See link below)"
    home: /home/piet
```

## Generate user password hash:

pwgen -s -1 | tee pwd | mkpasswd -m sha-512 -s ;cat pwd

http://docs.ansible.com/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module
