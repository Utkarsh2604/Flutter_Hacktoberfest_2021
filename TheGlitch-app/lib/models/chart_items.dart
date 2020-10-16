import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final int confirmed;
  final int recovered;
  final int deaths;

  Item({this.confirmed, this.recovered, this.deaths});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildItem(confirmed, 'Confirmed', Colors.yellowAccent[400]),
        buildItem(recovered, 'Recovered', Colors.greenAccent[400]),
        buildItem(deaths, 'Death', Colors.redAccent[400]),
      ],
    );
  }

  Widget buildItem(int value, String text, Color textColor) {
    double val = value > 1000000
        ? value / 1000000
        : (value > 1000 ? value / 1000 : value.toDouble());

    String unit = value > 1000000 ? 'M' : (value > 1000 ? 'K' : '');
    String input = val.toStringAsFixed(3);

    return Flexible(
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            child: Text(
              '$input$unit',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
