---
layout: post
title: 自适应手机屏幕分辨率
categories: [Web,CSS]
description: Web
keywords: Web, CSS, Media Query
---

### 几个概念
- 
css media query经常采用 max


### iphone 手机的分辨率相关参数

|           机型                |      Points       |      Rendered Pixels         |      Physical Pixels      |      Physical Device        |
|:----------------------------:|:-----------------:|:----------------------------:|:-------------------------:|:----------------------------:|
|      iPhone 2G,3G,3GS        |      320x480      |      320x480                 |                           |           3.5                |
|      iPhone 4,4s             |      320x480      |      640x960                 |                           |           3.5                |
|      iPhone 5,5s,5c,SE       |      320x568      |      640x1136                |                           |           4                  |
|      iPhone 6,6s,7,8         |      375x667      |      750x1334                |                           |           4.7                |
|      iPhone 6+,6s+,7+,8+     |      414x736      |      1242x2208               |           1080x1920       |           5.5                |
|      iPhone X, Xs            |      375x812      |      1125x2436               |                           |           5.8                |
|      iPhone Xs               |      414x896      |      828x1792                |                           |           6.1                |
|      iPhone Xs Max           |      414x896      |      1242x2688               |                           |           6.5                |


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

### 参考资料
- <https://kangzubin.com/iphone-resolutions/#group-1>