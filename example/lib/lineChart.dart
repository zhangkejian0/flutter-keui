import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatefulWidget {
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  charts.Color lineColor = charts.Color(r: 255, g: 83, b: 83);
  List<charts.Series<TimeSeriesSales, num>> seriesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = [
      charts.Series<TimeSeriesSales, num>(
          id: 'Sales',
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: [
            TimeSeriesSales(450, 11, lineColor),
            TimeSeriesSales(451, 22, lineColor),
            TimeSeriesSales(452, 32, lineColor),
            TimeSeriesSales(453, 42, lineColor),
            TimeSeriesSales(454, 52, lineColor),
          ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    final customTickFormatter =
        charts.BasicNumericTickFormatterSpec((num value) => '$value');
    return Scaffold(
      appBar: AppBar(title: Text('折线图')),
      body: Center(
          child: Container(
        child: charts.LineChart(seriesList,
            animate: true,
            primaryMeasureAxis: new charts.NumericAxisSpec(
                tickFormatterSpec: customTickFormatter),
            domainAxis: new charts.NumericAxisSpec(
              tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                <charts.TickSpec<num>>[
                  new charts.TickSpec(450, label: '01'),
                  new charts.TickSpec(451, label: '02'),
                  new charts.TickSpec(452, label: '001'),
                  new charts.TickSpec(453, label: '=='),
                  new charts.TickSpec(454, label: '98'),
                ],
              ),
            ),
            behaviors: [
              charts.RangeAnnotation([
                charts.RangeAnnotationSegment(
                    5, 20, charts.RangeAnnotationAxisType.measure,
                    startLabel: '',
                    endLabel: '警戒线',
                    labelAnchor: charts.AnnotationLabelAnchor.end,
                    color: charts.MaterialPalette.red.shadeDefault),
              ]),
            ]),
      )),
    );
  }
}


class TimeSeriesSales {
  final num time;
  final int sales;
  final charts.Color color;

  TimeSeriesSales(
    this.time,
    this.sales,
    this.color,
  );
}
