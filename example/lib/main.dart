import 'package:flutter/material.dart';
import 'package:keui/keui.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String markArea = ''' 
    {
      data: [
        [{
          yAxis: '200'
        }, {
          yAxis: '100'
        }]
      ]
    },
  ''';
  String markLine = '''
    {
      symbol: "none",
      data: [
        {
          silent: false, //鼠标悬停事件  true没有，false有
          lineStyle: {
            //警戒线的样式  ，虚实  颜色
            type: "solid",
            color: "#3398DB"
          },
          label: {
            position: "end",
            formatter: "警戒线(150)"
          },
          yAxis: 150 // 警戒线的标注值，可以有多个yAxis,多条警示线   或者采用   {type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
        },
        {
          silent: false, //鼠标悬停事件  true没有，false有
          lineStyle: {
            //警戒线的样式  ，虚实  颜色
            type: "solid",
            color: "#FA3934"
          },
          label: {
            position: "end",
            formatter: "警戒线(350)",
            fontSize: "8"
          },
          yAxis: 350 // 警戒线的标注值，可以有多个yAxis,多条警示线   或者采用   {type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
        }
      ]
    }
  ''';

  String colorTemplate1 = ''' [[0.2, "rgba(255,0,0,0.8)"], [0.8, "rgba(0,255,255,0.8)"], [1, "rgba(0,255,0,0.8)"]] ''';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                width: 500,
                height: 250,
                child: Echarts(
                  option: ''' 
              {
                tooltip: {
                  trigger: "axis"
                },
                grid: {
                  left: "3%",
                  right: "10%",
                  bottom: "10%",
                  top: "3%",
                  containLabel: true
                },
                xAxis: {
                  type: "category",
                  boundaryGap: false,
                  data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
                },
                yAxis: {
                  type: "value"
                },
                series: [
                  {
                    name: "邮件营销",
                    type: "line",
                    stack: "总量",
                    data: [120, 132, 101, 134, 90, 230, 210],
                    markLine: $markLine,
                    markArea: $markArea
                  },
                ]
              }
              ''',
                )),
              Container(
                width: 400,
                height: 300,
                child: Echarts(
                  option: '''
                    {
                        tooltip: {
                            formatter: '{a} <br/>{b} : {c}%'
                        },
                        series: [
                            {
                                name: '业务指标',
                                type: 'gauge',
                                detail: {formatter: ''},
                                data: [{value: 50}],
                                axisLine: {             // 仪表盘轴线(轮廓线)相关配置。
                                    show: true,             // 是否显示仪表盘轴线(轮廓线),默认 true。
                                    lineStyle:{
                                        color: $colorTemplate1,  //仪表盘的轴线可以被分成不同颜色的多段。每段的  结束位置(范围是[0,1]) 和  颜色  可以通过一个数组来表示。默认取值：[[0.2, '#91c7ae'], [0.8, '#63869e'], [1, '#c23531']]
                                        opacity: 1,                 //图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
                                        width: 30,                  //轴线宽度,默认 30。
                                        shadowBlur: 20,             //(发光效果)图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。 
                                        shadowColor: "#fff",        //阴影颜色。支持的格式同color。
                                    }
                                },
                            }
                        ]
                    }
                  ''',
                )
              )
          ],
        )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
