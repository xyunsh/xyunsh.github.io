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

## 资料
- [网页超炫动态效果，HTML5+CSS+JS实现源码](http://www.cnblogs.com/lhb25/p/8-amazing-codepen-demos.html)
- [如果遇到问题，先看看官方文档如何解释，The HTML 5 JavaScript API ](http://html5index.org/)
- [期待已久的2013年度最佳 jQuery 插件揭晓，有源码 ](http://www.cnblogs.com/lhb25/p/best-jquery-plugins-of-2013.html)
- [网站字体渲染！聊聊各浏览器下字体排版一致的问题 ](http://www.uisdc.com/website-font-rendering-process)
- [优秀且免费的照片库 ](http://jianshu.io/p/5b7b09b93875)
- [非常好的界面设计分享，用户体验是润物无声地留住用户必由之路 ](http://www.cnblogs.com/Wayou/p/goodui.html)
- [10个最好的 Node.js MVC 框架 ](http://www.cnblogs.com/lhb25/p/10-best-node-js-mvc-frameworks.html)
- [20个HTML5/CSS3超酷应用，含源码 ](http://www.gbtags.com/gb/share/2818.htm?utm_source=tuicool)
- [5个JavaScript调试技巧 ](http://www.lembed.com/5-javascript-debugging-tips-youll-start-using-today/)
- [NodeJS教程 ](http://nqdeng.github.io/7-days-nodejs/#1)
- [Web 项目可能会用到的20款优秀的开源工具 ](http://www.cnblogs.com/lhb25/p/20-excellent-open-source-tools.html)
- [35个让人惊讶的 CSS3 动画效果演示 ](http://www.cnblogs.com/lhb25/archive/2011/11/22/best-awesome-css3-animation-demos.html]


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