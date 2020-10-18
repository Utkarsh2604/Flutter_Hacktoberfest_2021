import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covico/data/models/time_count_model.dart';
import 'package:covico/ui/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final bool animate;
  final List<charts.Series<DistrictConfirmedModel, String>> series;

  SimpleBarChart({this.series, this.animate: false});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      series,
      animate: animate,
      vertical: false,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.gray.shadeDefault,
          ),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.MaterialPalette.black,
          ),
        ),
      ),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.gray.shadeDefault),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: ThemeSwitcher.of(context).isDarkModeOn
                ? charts.MaterialPalette.black
                : charts.MaterialPalette.white,
          ),
        ),
      ),
    );
  }
}
