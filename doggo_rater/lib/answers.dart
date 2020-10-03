import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
class Answers extends StatelessWidget {
  final Function(int) _answerQuestion;
  Answers(this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
        [
          ClipRRect(child: RaisedButton(child: Text('Good Boi'),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () => _answerQuestion(0),
              padding: EdgeInsets.symmetric(horizontal: _width/5),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
         ClipRRect(child: RaisedButton(child: Text('I have crippling decision anxiety.',),
              onPressed: () => _answerQuestion(1),
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: _width/5 - 70),
            ),
           borderRadius: BorderRadius.circular(15),
         ),
         ClipRRect(child: RaisedButton(child: Text('Heckin floofer'),
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () => _answerQuestion(2),
              padding: EdgeInsets.symmetric(horizontal: _width/5 - 15)
            ),
           borderRadius: BorderRadius.circular(15),
         ),
        ],),
    );
  }
}
