# Role Keepalived

This installs the Keepalived roles.

## Requirements

* None

## Supported system

* Ubuntu 12.04

## Installation

No extra steps needed.

## Usage

The role needs variabels in host_vars.

Example:

```yaml
keepalived:
  notification_email:
    - 'root@localhost'
  state: 
  prio: 
  pass: 
  router_id: 
  extvip:
    - '<ext vip>/32'
  intvip:
    - '10.0.0.1/32'
```
