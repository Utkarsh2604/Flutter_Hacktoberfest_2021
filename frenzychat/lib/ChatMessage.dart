import 'package:flutter/material.dart';

const String name = "Saif";

class chatMessage extends StatelessWidget {

final String text;

chatMessage({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              child: Text(name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Container(margin: EdgeInsets.only(top: 5.0),child: Text(text),)
            ],
          )
        ],
      ),
    );
  }
}
