import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keui/keui.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './gauge.dart';
import './lineChart.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<charts.Series> get seriesList => _createRandomData();
  static List<charts.Series<GaugeSegment, String>> _createRandomData() {
    final random = new Random();

    final data = [
      new GaugeSegment('Low', 0),
      new GaugeSegment('Acceptable', random.nextInt(100)),
      new GaugeSegment('High', random.nextInt(100)),
      new GaugeSegment('Highly Unusual', random.nextInt(100)),
    ];
    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            CupertinoButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GaugeChart()));
              },
              child: Text('油表图'),
            ),
            CupertinoButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LineChart()));
              },
              child: Text('折线图'),
            )
          ],
        )
        );
  }

  static List<charts.Series<GaugeSegment, String>> _createSampleData() {
    final data = [
      new GaugeSegment('Low', 75),
      new GaugeSegment('Acceptable', 100),
      new GaugeSegment('High', 50),
      new GaugeSegment('Highly Unusual', 5),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final num size;
  GaugeSegment(this.segment, this.size);
}