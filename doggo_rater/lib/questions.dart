import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String _questionText;
  Questions(this._questionText);
  
  @override
  Widget build(BuildContext context) {
    return (Text(
      _questionText,
      style:
      TextStyle(
        color: Colors.white,
        fontSize: 20,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,));
  }
}
