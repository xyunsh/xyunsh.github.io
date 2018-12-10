---
layout: wiki
title: CSS
categories: Web
description: 收集CSS资料。
keywords: CSS
---

## flex布局
- <http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html>

## Demo
### 文字带颜色下划线
<style tyle="css">
    p { color: #333 }
    p::after { content:""; height: 2px; background-color:#eee; display: block; margin-top: 20px; border-left: solid 80px #ffc100;}
</style>
<p>文字带颜色下划线</p>


## Tips
- [A Space Between Inline-block list items](http://stackoverflow.com/questions/5256533/a-space-between-inline-block-list-items)

- 字体对应
* 100 - Thin
* 200 - Extra Light (Ultra Light)
* 300 - Light
* 400 - Regular (Normal、Book、Roman)
* 500 - Medium
* 600 - Semi Bold (Demi Bold)
* 700 - Bold
* 800 - Extra Bold (Ultra Bold)
* 900 - Black (Heavy)