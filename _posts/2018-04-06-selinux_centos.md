---
layout: post
title: "SELinux"
date: 2018-04-06 04:31
tags:
- CentOS
- サーバ
permalink: /selinux
---

## SELinuxのステータスを確認
たまにコマンド忘れるのでメモ
```
[root@fortune ~]# sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   permissive
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      28
[root@fortune ~]#
```
