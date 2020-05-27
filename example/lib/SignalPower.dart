import 'package:flutter/material.dart';
import 'package:keui/keui.dart';

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