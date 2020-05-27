import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:keui/keui.dart';


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

