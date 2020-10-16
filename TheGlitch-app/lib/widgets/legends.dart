import 'package:flutter/material.dart';

class Legends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildRow('Active', Colors.yellowAccent[700]),
        SizedBox(width: 15.0),
        buildRow('Recovered', Colors.greenAccent[700]),
        SizedBox(width: 15.0),
        buildRow('Deaths', Colors.redAccent[700]),
      ],
    );
  }

  Widget buildRow(String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }
}
