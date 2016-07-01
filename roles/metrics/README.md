# Ansbile role: metrics

An Ansible role that install [graphite](http://graphite.wikidot.com/) and [grafana](http://grafana.org/) for application metrics collection and visualisation.

## Requirements

In order for other applications to report metrics to Graphite, the ports 2003 and 2004 should be accessible for machines
in the cluster. Users should be able to access the Grafana UI, exposed by default on port 3000.

## Role variables

The most important variables for this role are detailed bellow.

| variable | description | default |
| graphite_ui_port    | port for Graphite API, binds only on localhost | 3001 |
| graphite_timezone   | timezone for Graphite events | UTC |
| graphite_secret_key | key Graphite uses for auth tokens, should be changed if Graphite API is exposed | random value |
| grafana_ui_port     | port for Grafana UI | 3000 |
| grafana_org_name    | organisation anonymous Grafana users are allowed to access | Certo |

## Example playbook

```yaml
  - hosts: logserver
  roles:
    - {role: metrics }
  ```