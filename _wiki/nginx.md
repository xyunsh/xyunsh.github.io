---
layout: wiki
title: nginx
categories: Tools
description: nginx
keywords: nginx
---

# nginx query string rewrite

网站改版，需要将类似www.xxx.com/data/index.php?/detail/index/232323的 url 301 www.xxx.com/details/232323

nginx作为负载均衡

```sh
location /data/index.php {
　　if ($query_string ~* "/detail/index/(\d+)$"){
　　　　set $productId $1;
　　　　rewrite ^/data/index.php$ /details/$productId? permanent;
　　　}
}
```
## 参考资料：
- <http://wiki.nginx.org/NginxHttpRewriteModule#rewrite>
- <http://nginx.org/en/docs/http/ngx_http_rewrite_module.html>

 

# nginx配置

- ~ 区分大小写匹配
- ~* 不区分大小写匹配
- !~,!~* 区分大小写不匹配，不区分大小写不匹配
- ^ 以什么开头的匹配
- $ 以什么结尾的匹配

参考资料：
<http://www.howtocn.org/nginx:pcre>