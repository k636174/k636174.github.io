---
layout: post
title: "CentOS7を認証をActiveDirectoryで行う"
permalink: /centos7-add-ad
date: 2018-03-03 18:54
tags:
- CentOS7
- Linux
- 自宅サーバ
---
## 今回やりたいこと

WindowsServer2012R2で構成済みのActiveDirectoryの認証情報を使って、CentOS7でもSSHでログインしたい。

## 前提条件

参加するドメイン名：private.k636174.net
プライマリAD：192.168.1.209
セカンダリAD：192.168.1.220

## 必用なパッケージの導入

<pre class="theme:coy lang:default highlight:0 decode:true " title="rebuilddb"># yum -y install realmd sssd oddjob oddjob-mkhomedir adcli samba-common
</pre>

## DNSをADに向ける（向いてない場合は逐次調整）

```
[root@lover ~]# nmcli device
デバイス タイプ 状態 接続
eth0 ethernet 接続済み eth0
lo loopback 管理無し --
[root@lover ~]# nmcli device show eth0
GENERAL.デバイス: eth0
GENERAL.タイプ: ethernet
GENERAL.ハードウェアアドレス: 00:15:5D:01:DC:01
GENERAL.MTU: 1500
GENERAL.状態: 100 (接続済み)
GENERAL.接続: eth0
GENERAL.CON パス: /org/freedesktop/NetworkManager/ActiveConnection/1
WIRED-PROPERTIES.キャリア: オン
IP4.アドレス[1]: 192.168.1.216/24
IP4.ゲートウェイ: 192.168.1.2
IP4.DNS[1]: 192.168.1.209
IP4.DNS[2]: 192.168.1.220
IP4.DNS[3]: 192.168.1.2
IP6.アドレス[1]: fe80::d1df:c674:ba28:232d/64
IP6.ゲートウェイ:
[root@lover ~]#
```

## ドメインをdiscover
```
[root@lover ~]# realm discover private.k636174.net
private.k636174.net
type: kerberos
realm-name: PRIVATE.K636174.NET
domain-name: private.k636174.net
configured: no
server-software: active-directory
client-software: sssd
required-package: oddjob
required-package: oddjob-mkhomedir
required-package: sssd
required-package: adcli
required-package: samba-common-tools
[root@lover ~]#
```

## ドメインへ追加
```
[root@lover ~]# realm join private.k636174.net
Administrator に対するパスワード:
See: journalctl REALMD_OPERATION=r146253.19588
realm: Couldn't join realm: Necessary packages are not installed: oddjob, oddjob-mkhomedir, sssd, samba-common-tools
[root@lover ~]#
```

## パッケージが無いと怒られたので気を取り直して。。。。
```
[root@lover ~]# yum -y install oddjob oddjob-mkhomedir sssd samba-common-tools
```
## リトライ（ドメインへ追加）
```
[root@lover ~]# realm join private.k636174.net
Administrator に対するパスワード:
[root@lover ~]#
```

## ログイン時にドメイン名毎回入れるの面倒なので調整
```
[root@lover ~]# cat /etc/sssd/sssd.conf | grep FALSE
use_fully_qualified_names = FALSE &lt;-----FALSEへ変更
[root@lover ~]#
[root@lover ~]# systemctl restart sssd
[root@lover ~]# id administrator
uid=1604200500(administrator) gid=1604200513(domain users) groups=1604200513(domain users),1604200512(domain admins),1604200572(denied rodc password replication group),1604200520(group policy creator owners),1604200518(schema admins),1604200519(enterprise admins)
[root@lover ~]#
```
