import 'package:covico/constants/spaces.dart';
import 'package:covico/data/models/district_wise_model.dart';
import 'package:covico/data/models/time_count_model.dart';
import 'package:covico/ui/widgets/simple_bar_chart.dart';
import 'package:covico/ui/widgets/theme_inherited_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class BuildDistrictList extends StatelessWidget {
  final List<DistrictData> districtDataList;

  const BuildDistrictList({Key key, this.districtDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DistrictConfirmedModel> data = [];
    districtDataList.forEach((element) {
      data.add(DistrictConfirmedModel(element.district, element.confirmed));
    });

    List<charts.Series<DistrictConfirmedModel, String>> series = [
      charts.Series<DistrictConfirmedModel, String>(
        id: 'District',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (DistrictConfirmedModel districtConfirmedModel, _) =>
            districtConfirmedModel.district,
        measureFn: (DistrictConfirmedModel districtConfirmedModel, _) =>
            districtConfirmedModel.confirmed,
        data: data,
      )
    ];

    List<Widget> districts = [];
    districtDataList.forEach((element) {
      districts.add(_BuildDistrictItem(
        districtData: element,
      ));
    });
    return ListView(
      padding: EdgeInsets.all(4.0),
      children: <Widget>[
        Container(
          height: districtDataList.length > 5
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * .2,
          child: SimpleBarChart(
            series: series,
            animate: false,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No. Of Confirmed Cases',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
        Spaces.h32,
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4.0,
          runSpacing: 4.0,
          runAlignment: WrapAlignment.center,
          children: districts,
        ),
        Spaces.h32,
      ],
      primary: true,
      shrinkWrap: true,
    );
  }
}

class _BuildDistrictItem extends StatelessWidget {
  final DistrictData districtData;

  const _BuildDistrictItem({Key key, this.districtData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.grey,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "${districtData.district}",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: ThemeSwitcher.of(context).isDarkModeOn
                        ? Colors.grey
                        : Colors.black,
                  ),
            ),
            Spaces.h4,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Confirmed',
                  style: Theme.of(context).textTheme.caption,
                ),
                Spaces.w4,
                Container(
                  height: 16.0,
                  child: VerticalDivider(
                    width: 1.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Spaces.w4,
                Text(
                  '${districtData.confirmed}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
