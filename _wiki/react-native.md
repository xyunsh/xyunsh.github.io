---
layout: wiki
title: React Native
categories: App
description: 收集React Native开发资料。
keywords: React Native
---

#### tips
- [React Native知识库](http://lib.csdn.net/base/reactnative)
- [reveal-2](http://revealapp.com/blog/reveal-2.html)
- [React Native 新手村 : Unable to resolve module ...](http://logme.logdown.com/posts/708445/novice-react-native-village-unable-to-resolve-module)
- [react-native-community](https://github.com/react-native-community)
- [react-native-elements](https://github.com/react-native-community/react-native-elements)
- [react-native-guide](https://github.com/reactnativecn/react-native-guide)
- [React Native常用组件Image使用](http://www.cnblogs.com/miaomiaoshen/p/6011414.html)
- [React-Native 样式指南](https://github.com/doyoe/react-native-stylesheet-guide)
- [The Shapes of React Native](http://browniefed.com/blog/the-shapes-of-react-native/)
- [保存文件到本地](http://stackoverflow.com/questions/38134499/save-remote-image-to-camera-roll-in-react-native)

#### compile error
- [React Native on XCode Beta 8.0: how to fix initial build error](https://medium.com/@alberto.schiabel/react-native-on-xcode-beta-8-0-how-to-fix-initial-build-error-f0225c649850#.dp2zgncxk)

#### Components
- [react-native-swiper](https://github.com/leecade/react-native-swiper)
- [react-native-check-box]
- [react-native-easy-toast]
- [react-native-splash-screen]
- [react-native-htmlview]
- [react-native-parallax-scroll-view(下拉图片放大)](https://github.com/jaysoo/react-native-parallax-scroll-view)
- [react-native-scrollable-tab-view]
- [react-native-sortable-listview]
- [react-native-tab-navigator]
- [react-native-alphabetlistview](https://github.com/sunnylqm/react-native-alphabetlistview)
- [react-native-lightbox](https://github.com/oblador/react-native-lightbox)
- [react-native-keyboard-spacer](https://github.com/Andr3wHur5t/react-native-keyboard-spacer)
- [react-native-keyboard-aware-scroll-view](https://github.com/APSL/react-native-keyboard-aware-scroll-view)


#### git
- [GitHubPopular](https://github.com/crazycodeboy/GitHubPopular)
- [RNStudyNotes](https://github.com/crazycodeboy/RNStudyNotes)
- [30-days-of-react-native](https://github.com/fangwei716/30-days-of-react-native)
- [snowflake](https://github.com/bartonhammond/snowflake )

#### 坑
##### ios
- 添加了baidu map，各种编译不过，Product -> Scheme -> Manage Schemes 找到项目名，删掉之后，重新添加一下就ok了。
- [Bitcode在链接静态库时的问题处理 “ld: bitcode bundle could not be generated because”](http://www.cocoachina.com/bbs/read.php?tid=744514)。这个直接把Enable Bitcode关掉了。



### Xcode
- [Xcode打包ipa的基本步骤](http://www.jianshu.com/p/a19d2d0747ee)
- [React Native ios打包](https://segmentfault.com/a/1190000006668359)

### CodePush
- [React Native应用部署/热更新-CodePush最新集成总结](https://github.com/crazycodeboy/RNStudyNotes/tree/master/React%20Native%E5%BA%94%E7%94%A8%E9%83%A8%E7%BD%B2%E3%80%81%E7%83%AD%E6%9B%B4%E6%96%B0-CodePush%E6%9C%80%E6%96%B0%E9%9B%86%E6%88%90%E6%80%BB%E7%BB%93) [简书](http://www.jianshu.com/p/9e3b4a133bcc)
- [React-Native 热部署 热更新](http://www.jianshu.com/p/aa296cc8a2cf)
- [React Native热部署](http://www.beansmile.com/blog/posts/react-native-hot-deployment)

### android
- [gradle 版本](https://jcenter.bintray.com/com/android/tools/build/gradle/)
   修改版本号，重新运行
- [adb logcat获取输出日志，参数可以过滤级别。 adb logcat *:W](http://blog.csdn.net/xyz_lmn/article/details/7004710)
- 修改包名后编译不过，提示： error: cannot find symbol
                .setUseDeveloperSupport(BuildConfig.DEBUG)
                                        ^
  symbol:   variable BuildConfig
  location: class MainActivity
 修复办法：In your MainActivity.java, you can check the first line is package com.YOU_APP_NAME;

- [error FileProvider](https://github.com/donglua/PhotoPicker/issues/164)
sdk之间配置冲突
Attribute provider#android.support.v4.content.FileProvider@authorities value=(com.dasouke.erp.ErpFileProvider) from AndroidManifest.xml:65:9-63
        is also present at [com.dasouke.erp:react-native-image-picker:unspecified] AndroidManifest.xml:14:13-60 value=(com.dasouke.erp.provider).
        Suggestion: add 'tools:replace="android:authorities"' to <provider> element at AndroidManifest.xml:63:7-71:18 to override.

See http://g.co/androidstudio/manifest-merger for more information about the manifest merger.

- [百度地图显示问题](http://blog.csdn.net/stevenhu_223/article/details/38333611)
　　相信很多人在开发百度地图的时候会出现百度地图有时候会加载不出来，只显示网格图。 这个问题究其原因就是申请百度key的时候填写的SHA1也就是指纹证书有问题。估计很多开发者都是照着百度开放平台上介绍的流程去申请的。

　　当然，照着百度开放平台上去申请是没错的。但是上面介绍的申请得到的指纹证书只是本地开发环境存在的默认签名文件debug.keystore的指纹证书。流程如下：

　　第一步：打开命令窗口，输入cd .android。（这一步说明开发环境默认的签名证书debug.keystore存放在C盘.android目录中）

　　第二步：进入.android目录后，接着输入keytool -list -v -keystore debug.keystore，这里的debug.keystore就是开发环境下默认的签名文件了。

　　值得注意的是：我们在开发一个apk发布在应用商店时，需要我们自己的生成的签名文件，这个签名文件和开发环境默认的签名文件肯定是不同的，至少指纹证书SHA1就不同。所以，当我们通过我们自己生成的签名文件导出签名的apk时，百度地图的key应该是我们自己的签名文件中的指纹证书，如果还是用的是debug.keystore的SHA1申请的key,百度地图自然就会有问题。比如，我们导出apk的签名文件名字为myapp.keystore;那么可以通过在命令窗口中输入keytool -list -v -keystore myapp.keystore得到SHA1，然后通过这个SHA1去申请百度key，这样，你导出的签名apk的百度地图功能就不会只显示方格图加载不出来地图的问题了。

　　总之：如果你用到百度地图功能的apk，仅仅是通过本地环境运行的，你完全可以按照百度开放平台上介绍的流程去获取SHA1。但是，如果你开发的apk是需要自己生成的签名文件(签名证书)导出，放到应用商店去给别人下载的。那么，你申请百度地图key的SHA1值，就应该是来自你生成的签名文件中的SHA1值，SHA1查看方式keytool -list -v -keystore 签名文件。（注意要进入文件所在路径再输入命令）。

### Valid stype props
> [
    alignItems
    alignSelf,
    backfaceVisibility,
    backgroundColor,
    borderBottomColor,
    borderBottomLeftRadius,
    borderBottomRightRadius,
    borderBottomWidth,
    borderColor,
    borderLeftColor,
    borderLeftWidth,
    borderRadius,
    borderRightColor,
    borderRightWidth,
    borderStyle,
    borderTopColor,
    borderTopLetRadius,
    borderTopRightRadius,
    borderTopWidth,
    borderWidth,
    bottom,
    color,
    flex
    flexDirection,
    flexWrap,
    fontFamily,
    fontSize,
    fontStyle,
    fontWeigt,
    height,
    justifyContent,
    left,
    letterSpacing,
    lineHeight,
    margin,
    marginBottom,
    marginHorizontal,//水平
    marginLeft,
    marginRight,
    marginTop,
    marginVertical,//垂直
    opacity,
    overflow,
    padding,
    paddingBottom,
    paddingHorizontal,//水平
    paddingLeft,
    paddingRight,
    paddingTop,
    paddingVertical,
    position,
    resizeMode,
    right,
    rotation,
    scaleX,
    scaleY,
    shadowColor,
    shadowOffset,
    shadowOpacity,
    shadowRadius,
    textAlign,
    textDecorationColor,
    textDecorationLine,
    textDecorationStyle,
    tintColor,
    top,
    transform,
    transformMatrix,
    translateX,
    translateY,
    width,
    writingDirection
]