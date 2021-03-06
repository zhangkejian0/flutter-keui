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
![Image text](https://github.com/zhangkejian0/flutter-keui/blob/master/images/DialogWidget.png)

### 2, flutter_echarts
flutter_echarts链接: (https://github.com/entronad/flutter_echarts/blob/master/README_CN.md)

组件使用效果
![Image text](https://github.com/zhangkejian0/flutter-keui/blob/echart/images/echart.jpg)


### 3， echarts_flutter 绘制油表图
    class GaugeChart extends StatefulWidget {
        @override
        _GaugeChartState createState() => _GaugeChartState();
        }

        class _GaugeChartState extends State<GaugeChart> {
        List<charts.Series>  seriesList = [charts.Series<GaugeSegment, String>(
            id: 'Segments',
            domainFn: (GaugeSegment segment, _) => segment.segment,
            measureFn: (GaugeSegment segment, _) => segment.size,
            data: [
                GaugeSegment('Low', 100, charts.Color(
                r: 255, g: 83, b: 83,)),
                GaugeSegment('Acceptable', 100, charts.Color(
                r: 93, g: 243, b: 145)),
                GaugeSegment('High', 100,  charts.Color(
                r: 255, g: 184, b: 92)),
            ],
            colorFn: (GaugeSegment segment, _) => segment.color,
        )];

        double angle = 0.3 * pi;
        @override
        void initState() {
            // TODO: implement initState
            super.initState();
        }
        @override


        Widget build(BuildContext context) {
            return Scaffold(
                body: Container(
                    width: 400,
                    height: 800,
                    child: gaugeChart(
                        seriesList,
                        animate: true,
                        arcWidth: 40,
                        angle: angle
                    ),
                )
                );
            }
        }

        /**
        * Container 要有width、height 必须要有值
        * 实现油表盘的二次封装
        * seriesList，animate 参考charts_flutter文档
        * arcWidth 圆环宽度
        * lineColor 表针颜色
        * lineLength 表针长度
        * angle 指针旋转角度 9点钟方向顺时针
        * 
        */

组件使用效果
![Image text](https://github.com/zhangkejian0/flutter-keui/blob/charts_flutter/images/gauge.jpg)

### 3， Canvas 绘制电池and信号

    Container(
        height: 100,
        width: 200,
        child: CustomPaint(
        foregroundPainter: PainterPower(value: 10)
        ),
    )

    Container(
        margin: EdgeInsetsDirectional.only(top:20),
        height: 100,
        width: 100,
        child: CustomPaint(
        foregroundPainter: PainterSingal(value: 20)
        ),
    ),
    
    /**
    * 根据Container创建Canvas画布大小
    * value 当前电量或信号值（0-100）
    * threshold 低电量或信号阀值（默认20）
    */

组件使用效果
![Image text](https://github.com/zhangkejian0/flutter-keui/blob/charts_flutter/images/SingalPower.jpg)

### 4， Canvas 绘制液位仪

    Container(
        width: 100,
        height: 200,
        child: CustomPaint(
        foregroundPainter: PainterLiquidlevel(value:60)
        )
    )

    /**
    * 根据Container创建Canvas画布大小
    * value 当前液位值 （0-100）
    * maxThreshold 预警线范围最大值 （0-100）默认85
    * minThreshold  预警线范围最小值 （0-100）默认20
    * auto  液位颜色是否自适应 =true 根据预警值颜色改变 =false 蓝色
    */

组件使用效果
![Image text](https://github.com/zhangkejian0/flutter-keui/blob/master/images/Liquidlevel.jpg)