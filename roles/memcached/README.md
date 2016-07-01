# Role memcached

Will install memcached packages.


## Usage:
Include in your host like this:

```yaml
- hosts: memcachedhost
  roles: {role: memcached}
```

If you want to manage the memcached template yourself (ex: ansible/templates/memcached/memcached.conf.j2)

```yaml
- hosts: memcachedhost
  roles: {role: memcached, memcached_external_template: files/memcached/memcached.conf.j2 }
```

If you want to use a file in the top directory of your ansible config: (ex: ansible/files/memcached/memcached.conf)
you can use:

```yaml
- { role: memcached, memcached_external_file: files/memcached/memcached.conf }

```

* Tested on Ubuntu 14.04

