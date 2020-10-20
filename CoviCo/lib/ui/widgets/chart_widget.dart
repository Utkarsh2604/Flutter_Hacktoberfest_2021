import 'package:charts_flutter/flutter.dart';
import 'package:covico/constants/spaces.dart';
import 'package:covico/data/models/time_count_model.dart';
import 'package:covico/ui/widgets/date_time_combo_line_point_char.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  ChartWidget({@required this.series});
  final List<Series<TimeCountModel, DateTime>> series;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.timeline,
              color: Colors.red,
            ),
            Spaces.w8,
            Text('Daily Deceased'),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.timeline,
              color: Colors.green,
            ),
            Spaces.w8,
            Text('Daily Recovered'),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.timeline,
              color: Colors.blueAccent,
            ),
            Spaces.w8,
            Text('Daily Confirmed'),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height:480,
          child: DateTimeComboLinePointChart(
            series,
            animate: false,
          ),
        ),
      ],
    );
  }
}
