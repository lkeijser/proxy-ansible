# Role haproxy

Will install haproxy packages and hatop.


## Usage:
To use the latest haproxy version:

```yaml
- hosts: haproxyhost
  roles: {role: haproxy, haproxy_version: 1.5}
```

If you want to manage the haproxy template yourself (ex: ansible/templates/haproxy/haproxy.cfg.j2)

```yaml
- hosts: haproxyhost
  roles: {role: haproxy, haproxy_external_template: files/haproxy/haproxy.cfg.j2 }
```

If you want to use a file in the top directory of your ansible config: (ex: ansible/files/haproxy/haproxy.cfg)
you can use:

```yaml
- { role: haproxy, haproxy_version: 1.5, haproxy_external_file: files/haproxy/haproxy.cfg }

```

If you want to copy a pem file for ssl: (ex: ansible/files/haproxy/ssl.pem)
you can use:

```yaml
- { role: haproxy, haproxy_version: 1.5, haproxy_external_file: files/haproxy/haproxy.cfg, haproxy_external_pem: files/haproxy/ssl.pem }

```

* Tested on Ubuntu 12.04

sample haproxy.cfg
```
# Managed by ansible, please do not edit manually as your
# changes are overwritten.

global
       log 127.0.0.1   local0 err
       log 127.0.0.1   local1 err
       stats socket     /var/run/haproxy.sock mode 0600 level admin
       maxconn         4096
       user            haproxy
       group           haproxy
       # enable for A+ rating
       #ssl-default-bind-ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-RSA-RC4-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES128-SHA:AES256-SHA256:AES256-SHA:RC4-SHA
       #tune.ssl.default-dh-param 2048
       daemon

defaults
      log             global
      mode            tcp
      option          tcplog
      retries         3
      maxconn         20000
      contimeout      50000
      clitimeout      50000
      srvtimeout      50000

frontend http-in
      mode http
      bind <vip>:80
      #bind <vip>:443 ssl crt /etc/ssl/private/ssl-cert-snakeoil.pem
      reqadd X-Forwarded-Proto:\ http
      # enable for A+ rating
      #acl secure dst_port eq 443
      #rsprep ^Set-Cookie:\ (.*) Set-Cookie:\ \1;\ Secure if secure
      #rspadd Strict-Transport-Security:\ max-age=31536000 if secure
      option forwardfor
      option http-server-close
      option httpclose

      default_backend appserver

backend appserver
      mode            http
      balance         leastconn
      cookie          SERVERID insert nocache indirect
      #option          httpchk HEAD /health.php HTTP/1.1\r\nHost:\ localhost

      server          app1 10.0.0.20:80 check cookie app1 rise 10 fall 3 slowstart 10m
      server          app2 10.0.0.21:80 check cookie app2 rise 10 fall 3 slowstart 10m
      option          redispatch
      retries         10

listen mysql
      bind            10.0.0.1:3306
      mode            tcp
      balance         roundrobin

      option          httpchk
      server          mysql_master 10.0.0.100:3306 check port 9200 inter 5000 fall 3 rise 10
      server          mysql_backup 10.0.0.110:3306 check port 9200 inter 5000 backup fall 3 rise 10

userlist UsersFor_HAProxyStatistics
      group admin users admin
      user admin insecure-password <password>

listen HAProxy-Statistics <vip>:8000
      mode http
      stats enable
      stats uri /stats
      option contstats
      stats refresh 10s
      stats show-node
      stats show-legends
      acl AuthOkay_ReadOnly http_auth(UsersFor_HAProxyStatistics)
      acl AuthOkay_Admin http_auth_group(UsersFor_HAProxyStatistics) admin
      stats http-request auth realm HAProxy-Statistics unless AuthOkay_ReadOnly
      stats admin if AuthOkay_Admin
```