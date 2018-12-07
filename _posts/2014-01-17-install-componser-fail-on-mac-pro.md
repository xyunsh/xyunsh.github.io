---
layout: post
title: mac pro 安装 composer 失败
categories: php
description: mac pro 安装 composer 失败
keywords: php, composer
---
<http://getcomposer.org/doc/00-intro.md#using-composer>

```shell
$ brew install josegonzalez/php/composer
```

出现错误：

```shell
composer: Missing PHP53, PHP54 or PHP55 from homebrew-php. Please install one of them before continuing
```

composer安装提示：
```shell
Note: If you receive an error saying PHP53 or higher is missing use this command to install php brew install php53-intl
````shell

执行$ brew install php54-intl 提示：

```shell
Error: No available formula for zlib
Please tap it and then try again: brew tap homebrew/dupes
Searching taps…
```

执行$ brew tap homebrew/dupes

再执行：$ brew install josegonzalez/php/composer

 

参考：<http://www.torounit.com/blog/category/php/>