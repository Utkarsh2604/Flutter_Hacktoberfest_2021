import 'package:chat_bot/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  MyButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBcolor,
        ),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        child: Icon(
          icon,
          size: 28.0,
        ),
      ),
    );
  }
}
