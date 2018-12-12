---
layout: wiki
title: Linux/Unix
categories: Linux
description: 类 Unix 系统下的一些常用命令和用法。
keywords: Linux
---

类 Unix 系统下的一些常用命令和用法。

## 实用命令

### wget 输出内容到console
```sh
wget -qO- http://www.baidu.com
```

### find
<http://www.cnblogs.com/skynet/archive/2010/12/25/1916873.html>
```sh
find . -name .svn|xargs rm -rf
```
查找node_modules之外的文件
```sh
find . -path ./node_modules -prune -o -type f -name "*.map";

find . -path ./node_modules -prune -o -type f -name "*.map"|xargs rm;//删除文件
```

### fuser

查看文件被谁占用。

```sh
fuser -u .linux.md.swp
```

### id

查看当前用户、组 id。

### lsof

查看打开的文件列表。

> An  open  file  may  be  a  regular  file,  a directory, a block special file, a character special file, an executing text reference, a library, a stream or a network file (Internet socket, NFS file or UNIX domain socket.)  A specific file or all the files in a file system may be selected by path.

#### 查看网络相关的文件占用

```sh
lsof -i
```

#### 查看端口占用

```sh
lsof -i tcp:5037
```

#### 查看某个文件被谁占用

```sh
lsof .linux.md.swp
```

#### 查看某个用户占用的文件信息

```sh
lsof -u xsh
```

`-u` 后面可以跟 uid 或 login name。

#### 查看某个程序占用的文件信息

```sh
lsof -c Vim
```

注意程序名区分大小写。

### 资料
- [工欲善其事，必先利其器，程序员的福音。好的生产力软件就是我们手中的霜之哀伤](http://typeof.net/c/cn-scott-hanselmans-2014-ultimate-developer-and-power-user-s-tool-list-for-windows.html)
- [小命令有大文章，Linux平台上 df 命令的一些有趣的事情](http://blog.tankywoo.com/blog/2014/01/28/some-problems-about-df-command/)
- [填一个C语言中的坑](http://blog.jobbole.com/57822/)
- [10条不常用的Linux命令，但是相见恨晚 ](http://www.lembed.com/10%E6%9D%A1%E4%B8%8D%E5%B8%B8%E7%94%A8%E7%9A%84linux%E5%91%BD%E4%BB%A4/)
- [vi/vim使用进阶，难得的是好东西在一个地方 ](http://easwy.com/blog/archives/advanced-vim-skills-catalog/)
- [Expert Android and Eclipse development knowledge ](http://www.vogella.com/tutorials/)
- [58个最好的开源存储项目，当业务需要的时候，我们得知道我们那些可以选择的。 ](http://www.lembed.com/58%E4%B8%AA%E6%9C%80%E5%A5%BD%E7%9A%84%E5%BC%80%E6%BA%90%E5%AD%98%E5%82%A8%E9%A1%B9%E7%9B%AE/)
- [斯坦福大学即将上线10门公开课 ](http://www.usit365.com/standfor-online-2014-02/ )
- [The Art of Unix Programming ](http://catb.org/esr/writings/taoup/html/)
- [机器学习自学指南，学习新知识的时候最幸福的事情，莫过于有个清晰的路线图 ](http://blog.jobbole.com/58937/)
- [Android Root破解原理，细思恐极 ](http://www.oschina.net/question/12_58383)
- [用Linux命令行管理网络：11个必须知道的命令 ](http://www.geekfan.net/7192/)
- [35 Fresh, Free and Flat UI Kits，移动设计非常好的参考，有下载 ](http://www.splashnology.com/article/fresh-free-flat-ui-kits/9845/)
- [为了对付我们宿敌——程序中的bug，有几个称手的武器还是不错的：15个bug跟踪程序 ](http://www.cnblogs.com/oooweb/p/best-15-bug-tracking-applications.html)
- [免费的VPN，FQ不是事 ](http://jianshu.io/p/f783122bc249)
- [48个计算机相关免费在线课程 ](http://www.reddit.com/r/learnprogramming/comments/1zms0p/heres_a_list_of_48_free_online_programmingcs/)
- [对用户负责，就是对自己负责——如何安全的存储用户的密码 ](http://www.freebuf.com/articles/web/28527.html)
- [充电？没时间啊，但是还是有只需一天的学习就能让程序员的生活更幸福的东东 ](http://www.cnblogs.com/vamei/p/3458615.html)
- [福利来了，霍比特人粉丝的福音 ](http://middle-earth.thehobbit.com/)
- [Google的人类文明史，对了，百度最近在忙什么？](http://www.google.com/culturalinstitute/home?view=fullscreen)
- [HTTPS详解，心里有底了，才能做得更好 ](http://blog.jobbole.com/45530/)
- [Linux 的启动流程详解，如果需要定制启动项，这篇文章是个非常好的参考 ](http://www.ruanyifeng.com/blog/2013/08/linux_boot_process.html)
