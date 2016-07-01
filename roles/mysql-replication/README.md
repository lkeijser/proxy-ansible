
# Role mysql-replication


# Usage

These variables are mandatory and configuration is per host_vars/ 

Example for sql1

```yaml
mysqlreplication:
  server_id: 1
  network: '"%"'
  replicationpassword: replication4life
  master_host: 10.0.0.110
  increment: 2
  incrementoffset: 1
```

# Usage

Example for sql2

```yaml
mysqlreplication:
  server_id: 2
  network: '"%"'
  replicationpassword: replication4life
  master_host: 10.0.0.100
  increment: 2
  incrementoffset: 2
```