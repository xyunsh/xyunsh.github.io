---
layout: post
title: 自适应手机屏幕分辨率
categories: [Web,CSS]
description: Web
keywords: Web, CSS, Media Query
---
css media query经常采用 min-width min-device-width来适配屏幕大小.

### 几个概念
- viewport  
- width: viewport width
- height: viewport height
- device width
- device height

[width versus device-width](http://www.javascriptkit.com/dhtmltutors/cssmediaqueries2.shtml)


### iphone 手机的分辨率相关参数

|           机型                |      Points       |      Rendered Pixels         |      Physical Pixels      |      Physical Device        |
|:----------------------------:|:-----------------:|:----------------------------:|:-------------------------:|:----------------------------:|
|      iPhone 2G,3G,3GS        |      320x480      |      320x480                 |                           |           3.5                |
|      iPhone 4,4s             |      320x480      |      640x960                 |                           |           3.5                |
|      iPhone 5,5s,5c,SE       |      320x568      |      640x1136                |                           |           4                  |
|      iPhone 6,6s,7,8         |      375x667      |      750x1334                |                           |           4.7                |
|      iPhone 6+,6s+,7+,8+     |      414x736      |      1242x2208               |           1080x1920       |           5.5                |
|      iPhone X, Xs            |      375x812      |      1125x2436               |                           |           5.8                |
|      iPhone Xr               |      414x896      |      828x1792                |                           |           6.1                |
|      iPhone Xs Max           |      414x896      |      1242x2688               |                           |           6.5                |

参考:<https://kangzubin.com/iphone-resolutions/#group-1>
![iPhone Resolutions](https://file.kangzubin.com/blog/static/20180919/iPhone-Resolutions.png)



### max-width min-width & max-device-width min-device-width

#### min-width

当width(min-width和max-width对应的width是什么?)大于375px的时候, html的font-size被设置为50px.

```css
@media screen and (min-width:375px) {
    html {
        font-size: 50px;
    }
}
```
我们看看min-width和min-device-width的关系. 通过window.matchMedia, 可以测试相关参数是多少
```js
window.matchMedia("(min-device-width:375px)")
```
```sh
MediaQueryList {media: "(min-device-width: 375px)", matches: true, onchange: null}
```

采用浏览器默认设置时:

|           机型                |   width       |   device-width    |
|:----------------------------:|:-------------:|:-----------------:|
|   iPhone 6,6s,7,8             |   980         |   375             |
|   iPhone 6+,6s+,7+,8+         |   980         |   414             |
|   iPhone X, Xs                |   980         |   375             |

可以看出width几乎都是980, 而device-width=设备的Points

我们设置 
```html
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
```
看看只有什么变化:

|           机型                |   width       |   device-width    |
|:----------------------------:|:-------------:|:-----------------:|
|   iPhone 6,6s,7,8             |   375         |   375             |
|   iPhone 6+,6s+,7+,8+         |   414         |   414             |
|   iPhone X, Xs                |   375         |   375             |

因为设置了viewport的width=device-width, 所以二者一致了.

所以,当我们采用750宽的设计稿进行css编写的时候, 我们可以采用设置html的font-size为 100*width/750 px, 这样设计稿上的1px对应0.01rem. (为什么我们不能直接设置html的font-size为width/750呢? 因为浏览器限制了font-size的最小值12px)

我们可以设置如下css:

```css


html {
    margin: 0 auto;
    font-size: 50px; /*100*375/750*/
}

@media screen and (min-width:320px) {
    html {
        font-size: 42px; /* 100*320/750 */
    }
}

@media screen and (min-width:375px) {
    html {
        font-size: 50px;
    }
}

@media screen and (min-width:414px) {
    html {
        font-size: 55px;
    }
}

@media screen and (min-width:600px) {
    html {
        font-size: 80px;
    }
}

@media screen and (min-width:768px) {
    html {
        font-size: 102px;
    }
}

@media screen and (min-width:1024px) {
    html {
        font-size: 136px;
        width:1024px;
    }
}

```
其他各种尺寸按照px/100来设置rem.

### 对于pc网站
参考 <http://www.cnblogs.com/polk6/p/5051935.html>
#### 屏幕信息
- screen.height ：屏幕高度。
- screen.width ：屏幕宽度。
- screen.availHeight ：屏幕可用高度。即屏幕高度减去上下任务栏后的高度，可表示为软件最大化时的高度。
- screen.availWidth ：屏幕可用宽度。即屏幕宽度减去左右任务栏后的宽度，可表示为软件最大化时的宽度。
任务栏高/宽度 ：可通过屏幕高/宽度 减去 屏幕可用高/宽度得出。如：任务栏高度 = screen.height - screen.availHeight

#### 浏览器信息
- window.outerHeight ：浏览器高度。
- window.outerWidth ：浏览器宽度。
- window.innerHeight ：浏览器内页面可用高度；此高度包含了水平滚动条的高度(若存在)。可表示为浏览器当前高度去除浏览器边框、工具条后的高度。
- window.innerWidth ：浏览器内页面可用宽度；此宽度包含了垂直滚动条的宽度(若存在)。可表示为浏览器当前宽度去除浏览器边框后的宽度。
工具栏高/宽度 ：包含了地址栏、书签栏、浏览器边框等范围。如：高度，可通过浏览器高度 - 页面可用高度得出，即：window.outerHeight - window.innerHeight。

#### 页面信息
- body.offsetHeight ：body总高度。
- body.offsetWidth ：body总宽度。
- body.clientHeight ：body展示的高度；表示body在浏览器内显示的区域高度。
- body.clientWidth ：body展示的宽度；表示body在浏览器内显示的区域宽度。
滚动条高度/宽度 ：如高度，可通过浏览器内页面可用高度 - body展示高度得出，即window.innerHeight - body.clientHeight