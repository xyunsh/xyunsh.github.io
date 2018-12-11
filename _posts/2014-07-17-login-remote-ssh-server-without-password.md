---
layout: post
title: ssh 免密码登入远程服务器
categories: Tools
description: ssh 免密码登入远程服务器
keywords: ssh
---

生成ssh密钥，将公钥上传至远程服务器~/.ssh目录下面（没有的话就建一个）：

```shell
ssh-keygen -t rsa
scp ~/.ssh/id_rsa.pub root@yourserver.com:/root/.ssh/
```
登录到远程服务器，导入公钥到authorized_keys（没有建一个）：

```shell
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
```
删除公钥

```shell
rm id_rsa.pub
```
 本地配置ssh config

```shell
Host server1
HostName 1.2.3.4
Port 22722
User root
IdentityFile ~/.ssh/id_rsa

Host server2
HostName 2.3.4.5
User root
```
这样就可以ssh server1,ssh server2登录远程服务器了。

 

## 参考资料：

* <http://www.cnblogs.com/dudu/archive/2012/12/11/linux-ssh-without-password.html>
* <http://dhq.me/use-ssh-config-manage-ssh-session>