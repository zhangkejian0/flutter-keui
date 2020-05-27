import 'package:flutter/material.dart';
import 'package:keui/keui.dart';
class Liquidlevel extends StatefulWidget {
  @override
  _LiquidlevelState createState() => _LiquidlevelState();
}

class _LiquidlevelState extends State<Liquidlevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('液位仪')
      ),
      body:Center(
        child: Container(
          width: 100,
          height: 200,
          child: CustomPaint(
            foregroundPainter: PainterLiquidlevel(value: 90)
          )
        )
      )
    );
  }
}