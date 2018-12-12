---
layout: wiki
title: ApiCloud
categories: App
description: ApiCloud资料
keywords: ApiCloud
---

## mac上配置adb以及sublime

主要参考这个帖子。<http://community.apicloud.com/bbs/forum.php?mod=viewthread&tid=4767>

## adb

启动adb server：
```sh
adb start-server
```
启动adb shell：
```sh
adb shell
```
 
## sublime：
1. new build system （配置文件：/Users/xsh/Library/Application Support/Sublime Text 3/Packages/User）
2. "shell_cmd": "adb push /Users/xsh/Works/apicloud/workspace/firstSample /sdcard/UZMap/wgt/A69***87222956"