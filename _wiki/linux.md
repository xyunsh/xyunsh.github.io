---
layout: wiki
title: Linux/Unix
categories: Linux
description: 类 Unix 系统下的一些常用命令和用法。
keywords: Linux
---

### shadowsocks 安装
<https://github.com/iMeiji/shadowsocks_install/wiki/shadowsocks-libev-%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85>

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


## 快捷键
Ubuntu Linux中的许多操作在终端（Terminal）中十分的快捷，记住一些快捷键的操作更得心应手。在Ubuntu中打开终端的快捷键是Ctrl+Alt+T。其他的一些常用的快捷键如下：

| 快捷键	        | 功能                                                                  |
|:-----------------|:---------------------------------------------------------------------|
| Tab	| 自动补全 |
| Ctrl+a	| 光标移动到开始位置 |
| Ctrl+e	| 光标移动到最末尾 |
| Ctrl+k	| 删除此处至末尾的所有内容 |
| Ctrl+u	| 删除此处至开始的所有内容 |
| Ctrl+d	| 删除当前字符 |
| Ctrl+h	| 删除当前字符前一个字符 |
| Ctrl+w	| 删除此处到左边的单词 |
| Ctrl+y	| 粘贴由Ctrl+u， Ctrl+d， Ctrl+w删除的单词 |
| Ctrl+l	| 相当于clear，即清屏 |
| Ctrl+r	| 查找历史命令 |
| Ctrl+b	| 向回移动光标 |
| Ctrl+f	| 向前移动光标 |
| Ctrl+t	| 将光标位置的字符和前一个字符进行位置交换 |
| Ctrl+&	| 恢复 ctrl+h 或者 ctrl+d 或者 ctrl+w 删除的内容 |
| Ctrl+S	| 暂停屏幕输出 |
| Ctrl+Q	| 继续屏幕输出 |
| Ctrl+Left-Arrow	| 光标移动到上一个单词的词首 |
| Ctrl+Right-Arrow	| 光标移动到下一个单词的词尾 |
| Ctrl+p	| 向上显示缓存命令 |
| Ctrl+n	| 向下显示缓存命令 |
| Ctrl+d	| 关闭终端 |
| Ctrl+xx	| 在EOL和当前光标位置移动 |
| Ctrl+x@	| 显示可能hostname补全 |
| Ctrl+c	| 终止进程/命令 |
| Shift+上或下	| 终端上下滚动 |
| Shift+PgUp/PgDn	| 终端上下翻页滚动 |
| Ctrl+Shift+n	| 新终端 |
| alt+F2	| 输入gnome-terminal打开终端 |
| Shift+Ctrl+T	| 打开新的标签页 |
| Shift+Ctrl+W	| 关闭标签页 |
| Shift+Ctrl+C	| 复制 |
| Shift+Ctrl+V	| 粘贴 |
| Alt+数字	| 切换至对应的标签页 |
| Shift+Ctrl+N	| 打开新的终端窗口 |
| Shift+Ctrl+Q	| 管壁终端窗口 |
| Shift+Ctrl+PgUp/PgDn	| 左移右移标签页 |
| Ctrl+PgUp/PgDn	| 切换标签页 |
| F1	| 打开帮助指南 |
| F10	| 激活菜单栏 |
| F11	| 全屏切换 |
| Alt+F	| 打开 “文件” 菜单（file） |
| Alt+E	| 打开 “编辑” 菜单（edit） |
| Alt+V	| 打开 “查看” 菜单（view） |
| Alt+S	| 打开 “搜索” 菜单（search） |
| Alt+T	| 打开 “终端” 菜单（terminal） |
| Alt+H	| 打开 “帮助” 菜单（help） |

另外一些小技巧包括：在终端窗口命令提示符下，连续按两次 Tab 键、或者连续按三次 Esc 键、或者按 Ctrl+I 组合键，将显示所有的命令及工具名称。Application 键即位置在键盘上右 Ctrl 键左边的那个键，作用相当于单击鼠标右键。

===== Terminal终端 =====
| 快捷键	        | 功能                                                                  |
|:-----------------|:---------------------------------------------------------------------|
| CTRL + ALT + T	|  打开终端 |
| TAB	|  自动补全命令或文件名 |
| CTRL + SHIFT + V	|  粘贴（Linux中不需要复制的动作，文本被选择就自动被复制） |
| CTRL + SHIFT + T	|  新建标签页 |
| CTRL + D	|  关闭标签页 |
| CTRL + L	|  清楚屏幕 |
| CTRL + R + 文本	|  在输入历史中搜索 |
| CTRL + A	|  移动到行首 |
| CTRL + E	|  移动到行末 |
| CTRL + C	|  终止当前任务 |
| CTRL + Z	|  把当前任务放到后台运行（相当于运行命令时后面加&） |
| ~	|  表示用户目录路径 |