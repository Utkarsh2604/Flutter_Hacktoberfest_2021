import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Section {
  final int currentIndex;
  final int active;
  final int deaths;
  final int recovered;

  Section({
    this.currentIndex,
    this.active,
    this.deaths,
    this.recovered,
  });

  List<PieChartSectionData> sections() {
    int total = active + recovered + deaths;
    double activeP;
    double recovP;
    double deathP;
    bool isAvailable = true;

    if (active == 0 || recovered == 0 || deaths == 0) {
      isAvailable = false;
    } else {
      activeP = (active / total) * 100;
      recovP = (recovered / total) * 100;
      deathP = (deaths / total) * 100;
    }

    return List.generate(3, (i) {
      final isTouched = i == currentIndex;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: isTouched
                ? Colors.yellowAccent[700]
                : Colors.yellowAccent[700].withOpacity(0.8),
            value: isAvailable ? activeP : 50,
            title: isTouched
                ? (isAvailable ? "${activeP.toStringAsFixed(2)}%" : "NA")
                : "",
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: isTouched
                ? Colors.greenAccent[400]
                : Colors.greenAccent[700].withOpacity(0.8),
            value: isAvailable ? recovP : 25,
            title: isTouched
                ? (isAvailable ? "${recovP.toStringAsFixed(2)}%" : "NA")
                : "",
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: isTouched
                ? Colors.redAccent[400]
                : Colors.redAccent.withOpacity(0.8),
            value: isAvailable ? deathP : 25,
            title: isTouched
                ? (isAvailable ? "${deathP.toStringAsFixed(2)}%" : "NA")
                : "",
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
