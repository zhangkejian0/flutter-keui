import 'package:flutter/material.dart';
import 'dart:ui';

class SingalPower extends StatefulWidget {
  @override
  _SingalPowerState createState() => _SingalPowerState();
}

class _SingalPowerState extends State<SingalPower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电池and信号')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 200,
              child: CustomPaint(
                foregroundPainter: PainterPower(value: 10)
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top:20),
              height: 100,
              width: 200,
              child: CustomPaint(
                foregroundPainter: PainterPower(value: 60)
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top:20),
              height: 100,
              width: 100,
              child: CustomPaint(
                foregroundPainter: PainterSingal(value: 20)
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top:20),
              height: 100,
              width: 100,
              child: CustomPaint(
                foregroundPainter: PainterSingal(value: 60)
              ),
            ),
          ],
        )
      )
    );
  }
}


class PainterPower extends CustomPainter{
  int value; // 电池电量值 （0-100）
  int threshold; // 低电量阈值 （默认20）
  PainterPower({this.value = 100, this.threshold = 20});

  @override
  void paint(Canvas canvas, Size size) {
    Color grey = Color.fromARGB(100, 219, 219, 219);
    Color green = Color.fromARGB(100, 16, 255, 6);
    Color red = Colors.red;
    // TODO: implement paint
    //构建一个电池头部
    Paint _paint0 = Paint()
    ..color = value > 99 ? green : grey;
    Rect rect = Rect.fromPoints(Offset(size.width, size.height * 0.4 ), Offset(size.width * 1.05, size.height * 0.6 ));
    canvas.drawRect(rect, _paint0);
    //构建一个电池身体
    Paint _paint1 = Paint()
    ..color = grey;
    Rect rect1 = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    canvas.drawRect(rect1, _paint1);

    //构建一个电池电量
    Paint _paint2 = Paint()
    ..color = value > threshold ? green : red;
    Rect rect2 = Rect.fromPoints(Offset(0, 0), Offset(size.width * (value / 100) , size.height));
    canvas.drawRect(rect2, _paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PainterSingal extends CustomPainter {
  int value; // 信号量信号值 （0-100）
  int threshold; // 低信号阈值 （默认20）
  PainterSingal({this.value = 100, this.threshold = 20});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Color grey = Color.fromARGB(100, 219, 219, 219);
    Color green = Color.fromARGB(100, 16, 255, 6);
    Color red = Colors.red;
    // 构建一个三角形信号背景
    Paint _paint0 = Paint()
    ..style = PaintingStyle.fill
    ..color = grey;
    canvas.drawPath(
      Path()
      ..moveTo(0, size.height)..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close(),
    _paint0);

    // 构建一个三角形信号量
    Paint _paint1 = Paint()
    ..style = PaintingStyle.fill
    ..color = value > threshold ? green : red;
    canvas.drawPath(
      Path()
      ..moveTo(0, size.height)..lineTo(size.width * ( value / 100), size.height)
      ..lineTo(size.width * ( value / 100), size.height * (1 - value / 100 ))
      ..close(),
    _paint1);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}