---
layout: wiki
title: Python
categories: Python
description: Python 常用模块及资源记录。
keywords: Python
---

### requests

优雅简单的 HTTP 模块。

### BeautifulSoup

很好用的 HTML/XML 解析器。

### json

JSON 编码解码器。

应用举例：

* 格式化 JSON 文件

  ```sh
  python -m json.tool src.json > dst.json
  ```

  在 Vim 里格式化 JSON：

  ```sh
  :%!python -m json.tool
  ```

### CGIHTTPServer

简单实用的 HTTP 服务器。

应用举例：

* 运行一个简易的 HTTP 服务器

  ```sh
  python -m CGIHTTPServer 80
  ```

### base64

方便地进行 base64 编解码的模块。

应用举例：

* 解码 base64

  ```sh
  echo aGVsbG93b3JsZA== | python -m base64 -d
  ```

  则能看到输出

  ```sh
  helloworld
  ```

### 参考资料 

- [Python在线教程，大名鼎鼎的Learn Python The Hard Way, 3rd Edition]( http://learnpythonthehardway.org/book/)
- [有效提高自己的方式莫过于学习优秀的项目，2013年最受欢迎的Python项目](http://pythontip.sinaapp.com/blog/post/9826/)
- [Python开发常用工具](http://blog.jobbole.com/58226/)
