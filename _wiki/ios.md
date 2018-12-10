---
layout: wiki
title: iOS
categories: App
description: 收集iOS开发资料。
keywords: iOS
---

## tips
- [Could not locate device support files](https://ighibli.github.io/2017/03/28/Could-not-locate-device-support-files/)
- [iOS-DeviceSupport](https://github.com/iGhibli/iOS-DeviceSupport)
- [Xcode 10 beta 趟坑](https://github.com/kingcos/Perspective/issues/13)

## blogs
- [https://github.com/ibireme](https://github.com/ibireme)
- [http://blog.ibireme.com/](http://blog.ibireme.com/)

## Release
- [iOS App上架流程(2016详细版）](http://www.jianshu.com/p/b1b77d804254)
- [this action could not be completed. try again. (-22421)](https://forums.developer.apple.com/thread/76803)
Try this, it fixed it for me. Open Terminal and run:

cd ~
mv .itmstransporter/ .old_itmstransporter/
"/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/itms/bin/iTMSTransporter"

iTMSTransporter will then update itself, then you can try uploading in XCode again.


## CocoaPods
- [引入第三方库出现警告](https://stackoverflow.com/questions/18376416/the-target-overrides-the-other-ldflags-build-setting-defined-in-pods-pods/18730481#18730481)
- [关于CocoaPod的使用中遇到的问题](http://www.cnblogs.com/lisaloveyou1900/p/5048783.html)


## 环信
- [集成](http://www.cnblogs.com/XYQ-208910/p/5396635.html)
- [React Native封装iOS原生UIViewController](https://ljunb.github.io/2016/08/05/React-Native%E5%B0%81%E8%A3%85iOS%E5%8E%9F%E7%94%9FUIViewController/#more)
- [集成环信遇到的相关问题整理](http://blog.csdn.net/jyt199011302/article/details/68483995)