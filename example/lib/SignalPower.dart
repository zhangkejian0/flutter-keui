import 'package:flutter/material.dart';

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
        
      ),
    );
  }
}

// canvar

class MyPainter extends CustomPainter{
  
  MyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}