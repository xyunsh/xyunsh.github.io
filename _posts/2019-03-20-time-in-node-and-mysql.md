---
layout: post
title: node & mysql中的时间函数
categories: [MySQL,Node]
description: node & mysql中的时间函数
keywords: MySQL, Node
---
### UTC 时间
- [ISO_8601时间格式标准](https://zh.wikipedia.org/wiki/ISO_8601)
譬如 2019-05-19T16:00:00.000Z
T代表UTC时间, Z代表4位数字格式时间偏移量,不写的时候默认不偏移.  上面的时间表示UTC时区2019年5月19日下午16点, 也就是北京时间2019年5月20日凌晨0点.

### unix时间戳
- Unix timestamp 定义为从格林威治时间1970年01月01日00时00分00秒起至现在的总秒数.UNIX时间戳的0按照ISO 8601规范为 ：1970-01-01T00:00:00Z.

### node时间
在node中, 使用Date.now() 获取unix时间戳.


### momentjs
- 获取星期第一天, 周日为星期第一天
```
 moment().startOf("week")
```
如果需要周一为第一天则使用
```
moment().startOf("isoWeek")
```
- 获取当月的天数
```
moment().daysInMonth();
moment("2012-02", "YYYY-MM").daysInMonth() // 29 
moment("2012-01", "YYYY-MM").daysInMonth() // 31 
```