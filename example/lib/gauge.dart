import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


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

Widget gaugeChart(List<charts.Series> seriesList, {bool animate, num arcWidth, Color lineColor, num lineLength, double angle}){
  /**
   * 实现油表盘的二次封装
   * seriesList，animate 参考charts_flutter文档
   * arcWidth 圆环宽度
   * lineColor 表针颜色
   * lineLength 表针长度
   * angle 指针旋转角度 9点钟方向顺时针
   * 
   */
  
  return Stack(
    children: <Widget>[
      charts.PieChart(
        seriesList,
        animate: animate,
        defaultRenderer: charts.ArcRendererConfig(
                arcWidth: arcWidth ?? 30, 
                startAngle: 1 * pi, 
                arcLength: 1 * pi
        ),
      ),
      // Center(
      //   child: Container(
      //     child: Transform.rotate(angle: angle ?? 0,child: Container(
      //         child:CustomPaint(
      //             foregroundPainter: MyPainter(
      //                 lineColor: lineColor ?? Colors.lightBlueAccent,
      //                 width: 1.4,
      //                 lineLength: lineLength ?? 120
      //           ),
      //         ),
      //     ),),
      //   ),
      // ),
      Center(
        // child: Transform(
          child: Transform.rotate(
            angle:  0.3 * pi,
            child: Image.asset('images/gauge.png',width: 240,),
          ),
        //   alignment: Alignment.topRight,
        //   transform: Matrix4.translationValues(-40, 0, 0),
        // ),
      )
    ],
  );
}

class GaugeSegment {
  final String segment;
  final int size;
  final charts.Color color;
  GaugeSegment(this.segment, this.size, this.color);
}


class MyPainter extends CustomPainter {
  // Canvas绘制油表箭头箭头
  Color lineColor;
  double width;
  double lineLength;

  MyPainter({this.lineColor, this.width, this.lineLength});
  @override
  void paint(Canvas canvas, Size size) {
    lineColor = lineColor ?? Colors.red;
    width = width ?? 1;
    Paint _paint1 =  Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = width
    ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, 0), Offset( -lineLength*0.8, -lineLength *0.02), _paint1);
    Paint _paint2 =  Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = width
    ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, 0), Offset( -lineLength*0.8, lineLength *0.02), _paint2);

    Paint _paint3 =  Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = width
    ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(-lineLength*0.8, lineLength*0.02), Offset( -lineLength*0.7, lineLength*0.08), _paint3);
    
    Paint _paint4 =  Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = width
    ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(-lineLength*0.7, lineLength*0.08), Offset( -lineLength, 0.0), _paint4);

    Paint _paint5 =  Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = width
    ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(-lineLength*0.8, -lineLength*0.02), Offset( -lineLength*0.7, -lineLength*0.08), _paint5);
    
    Paint _paint6 =  Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = width
    ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(-lineLength*0.7, -lineLength*0.08), Offset( -lineLength, 0.0), _paint6);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}