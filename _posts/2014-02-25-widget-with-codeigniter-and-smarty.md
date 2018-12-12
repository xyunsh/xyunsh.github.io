---
layout: post
title: CodeIgniter + smarty 实现widget功能
categories: [Web, PHP]
description: CodeIgniter + smarty 实现widget功能
keywords: CodeIgniter, Smarty
---

在开发过程中，经常需要widget功能，一可以隔离页面逻辑，二可以重用代码。结合smarty的plugin功能，可以方便的实现该功能。

譬如，我们的页面中可以这样写：

```html
    \{\{extends file='_layout.html'\}\} 

    \{\{block name='content'\}\}

    <!--content-->
    <div>
        <div>
            {{widgets path='widgets/carousel'}}
            {{widgets path='widgets/news'}}
        </div>
        {{widgets path='widgets/hots'}}
        {{widgets path='widgets/tops'}}
    </div>
    <!--/content-->

    \{\{/block\}\}
```

{{widgets path='widgets/news'}}表示调用widgets Controller 的news action，最终输出的html嵌入这里。

需要实现该功能，可以借助smarty 的function plugin，创建一个 function.widgets.php

```php
<?php
function smarty_function_widgets($params,&$smarty){
        
    $path = $params['path'];
    $args = isset($params['args']) ? $params['args'] : NULL;
    
    if($path){
        $ps = explode('/', $path);
        
        $controller = $ps[0];
        $method = $ps[1];
        
        require_once APPPATH.'controllers/'.$controller.'.php';
                
        $c = new $controller;
        
        if(!isset($params['args']))
            $c->$method();
        else
            $c->$method($args);
    }
}

?>
```