import 'package:flutter/material.dart';
import 'package:chat_bot/network/network_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:chat_bot/widgets/legends.dart';
import 'package:chat_bot/models/chart_items.dart';
import 'package:chat_bot/models/pie_chart_sections.dart';
import 'package:chat_bot/models/country_list.dart';

class Pie extends StatefulWidget {
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  int currentIndex;
  int confirmed = 0;
  int recovered = 0;
  int deaths = 0;
  int active = 0;
  String countryName = 'WorldWide';

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //DropDown Menu
        Container(
          padding: EdgeInsets.fromLTRB(10, 20.0, 0, 10.0),
          child: dropMenu(),
        ),
        SizedBox(height: 10.0),

        //data recieved from api is shown here
        Container(
          child: Item(
            confirmed: confirmed,
            recovered: recovered,
            deaths: deaths,
          ),
        ),

        //builds pie chart and calls the Section class to build its sections
        Container(
          margin: EdgeInsets.all(10.0),
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                setState(() {
                  if (pieTouchResponse.touchInput is FlLongPressEnd ||
                      pieTouchResponse.touchInput is FlPanEnd) {
                    currentIndex = -1;
                  } else {
                    currentIndex = pieTouchResponse.touchedSectionIndex;
                  }
                });
              }),
              sections: Section(
                currentIndex: currentIndex,
                active: active,
                deaths: deaths,
                recovered: recovered,
              ).sections(),
              centerSpaceRadius: 65,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),

        SizedBox(height: 5.0),

        //Legends are build in this row
        Center(
          child: Container(child: Legends()),
        ),
        // SizedBox(height: 10.0),
      ],
    );
  }

  void getCovidData() async {
    try {
      NetworkHelper network = NetworkHelper(country: countryName);
      var data = await network.getData();
      setState(() {
        confirmed = data['confirmed'];
        recovered = data['recovered'];
        deaths = data['deaths'];
        active = countryName == 'WorldWide' ? data['active'] : data['critical'];
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> dropMenu() {
    List<DropdownMenuItem<String>> w = [];
    List<String> names = CountryName().countryNames;

    for (String x in names) {
      var newItem = DropdownMenuItem(
        child: Text(x),
        value: x,
      );
      w.add(newItem);
    }

    return DropdownButton(
        value: countryName,
        items: w,
        iconEnabledColor: Colors.redAccent[400],
        iconSize: 25,
        icon: Icon(Icons.location_on),
        style: TextStyle(fontSize: 20),
        onChanged: (value) {
          setState(() {
            countryName = value;
            getCovidData();
          });
        });
  }
}
