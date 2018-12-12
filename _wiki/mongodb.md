---
layout: wiki
title: Mongodb
categories: Database
description: Mongodb资料
keywords: Database, Mongodb
---

# mac上安装mongodb

## 安装
```sh
brew install mongodb
```
 
## 启动
默认目录为/data/db，带路径启动命令：
```sh
mongod --dbpath /usr/local/var/mongodb
```

## 连接
```sh
mongo
```
 
## 配置文件在
/usr/local/etc/mongod.conf

```sh
xsh:etc xsh$ mongo
MongoDB shell version: 2.6.6
connecting to: test
> show dbs;
admin     (empty)
local     0.078GB
mean-dev  0.078GB
> use mean-dev
switched to db mean-dev
> show tables;
articles
sessions
system.indexes
users
> db.articles.find()
{ "_id" : ObjectId("5493d381cf948f5502dfc917"), "user" : ObjectId("5493d377cf948f5502dfc916"), "title" : "test", "content" : "xxx", "created" : ISODate("2014-12-19T07:28:01.831Z"), "__v" : 0 }
{ "_id" : ObjectId("5493d38acf948f5502dfc918"), "user" : ObjectId("5493d377cf948f5502dfc916"), "title" : "hao", "content" : "hoasofdsaofisho", "created" : ISODate("2014-12-19T07:28:10.172Z"), "__v" : 0 }
{ "_id" : ObjectId("5493da510ccbf80fe17854ae"), "a" : 1 }
>
```