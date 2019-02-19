---
layout: post
title: "ブログ用nginxの設定ファイル達"
date: 2018-11-17 21:55
tags:
- コマンド
- Linux
permalink: /blog_nginx
---

```
root@blog:~# uname -a
Linux blog 4.9.0-7-amd64 #1 SMP Debian 4.9.110-3+deb9u2 (2018-08-13) x86_64 GNU/Linux
root@blog:~# apt -y install nginx
root@blog:~# systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2018-11-18 13:35:57 JST; 1min 5s ago
     Docs: man:nginx(8)
  Process: 27343 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
  Process: 27339 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
 Main PID: 27344 (nginx)
    Tasks: 5 (limit: 4915)
   CGroup: /system.slice/nginx.service
           ├─27344 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           ├─27345 nginx: worker process
           ├─27346 nginx: worker process
           ├─27347 nginx: worker process
           └─27348 nginx: worker process

11月 18 13:35:57 blog systemd[1]: Starting A high performance web server and a reverse proxy server...
11月 18 13:35:57 blog systemd[1]: Started A high performance web server and a reverse proxy server.
root@blog:~# systemctl enable nginx
Synchronizing state of nginx.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable nginx
root@blog:~#
```
