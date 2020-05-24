[TOC]


# 基于Flutter的ui组件库
插件支持android 和IOS


-------
插件提供的功能

1. DialogMessage提示弹框,
2. ...,
3. ....
4. ....
5. 哈哈，目前还只有第一个...



## 1,引入
在pubspec.yaml 文件上引入如下配置


    引入方式1(引入最新的版本)
    keui:
        git:
            url: git://github.com/zhangkejian0/flutter-keui.git
    
    引入方式2 (引入指定某个版本)
    keui:
        git:
            url: git://github.com/zhangkejian0/flutter-keui.git
            ref: master
          
    引入方式3 (引入Flutter仓库的library)
          
    dependencies:
      keui: ^0.1.0 (ss被墙了，暂时没搞上去)
              
              
          
          
          
          
        


### 使用
### 1, DialogWidget
    DialogWidget(context,message:'message 示例',confirmCallback: (){

    });

    String title = '提示', //弹窗标题 默认：提示
    String message, //弹窗文字呢内容 默认：-- （widget == null时生效）
    Widget widget, // widget 内容如果不为null，则优先显示，message无效
    String cancelButtonText, //取消按钮文字 默认：取消
    String confirmButtonText, //确认按钮文字 默认：确认
    Function cancelCallback, // 取消按钮回调， 如果没有cancelCallback，那么这个按钮不会显示
    Function confirmCallback // 确认按钮回调， 如果没有confirmCallback，那么这个按钮不会显示

组件使用效果
![Image text](https://github.com/zhangkejian0/flutter-keui/blob/master/images/DialogWidget.jpg)