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
<style type="text/css">
    p.underline { color: #333 }
    p.underline::after { content:""; height: 2px; background-color:#eee; display: block; margin-top: 10px; border-left: solid 80px #ffc100;}
</style>
```css
p.underline         { color: #333 }
p.underline::after  { 
    content:""; 
    height: 2px; 
    background-color:#eee; 
    display: block; 
    margin-top: 10px; 
    border-left: solid 80px #ffc100;
}
```
<p class="underline">文字带颜色下划线</p>

### 文字两边带线
<style type="text/css">
    p.withline {
        color: #00af98;
        text-align: center;
        display: flex;
        align-items: center;
        padding: 0 180px;
        margin-top: 30px;
    }
    p.withline::before,
    p.withline::after, {    
        content: "";
        flex: 1;
        background-color: #00af98;
        height: 2px;
        margin: 0 10px;
    }
</style>
```css
    p.withline {
        color: #00af98;
        text-align: center;
        display: flex;
        align-items: center;
        padding: 0 180px;
        margin-top: 30px;
    }
    p.withline::before,
    p.withline::after, {    
        content: "";
        flex: 1;
        background-color: #00af98;
        height: 2px;
        margin: 0 10px;
    }
```
<p class="withline">文字两边带线</p>


## 资料
- <https://mdbootstrap.com/>

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