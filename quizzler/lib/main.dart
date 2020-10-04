import 'dart:io';

import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Qbrain quizbrain = Qbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

List<Icon> score = [];
void checkans(bool userans) {
  if (quizbrain.getqstnans() == userans) {
    score.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
  } else {
    score.add(Icon(
      Icons.close,
      color: Colors.red,
    ));
  }
}

// List<String> qstns = [
//   'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.'
// ];
// List<int> ans = [0, 1, 1];

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getqstntxt(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkans(true);
                if (quizbrain.checkend() == true) {
                  quizbrain.reset();
                  Alert(
                    context: context,
                    title: "Thankyou",
                    desc: 'Quiz has ended.Tap to restart!',
                    buttons: [
                      DialogButton(child: Text("OK!",style: TextStyle(color: Colors.white),), onPressed: () =>Navigator.pop(context))
                    ]
                  ).show();
                  score = [];
                }
                setState(() {
                  quizbrain.nextqstn();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkans(false);
                if (quizbrain.checkend() == true) {
                  quizbrain.reset();
                  Alert(
                    context: context,
                    title: "Thankyou",
                    desc: 'Quiz has ended.Tap to restart!',
                    buttons: [
                      DialogButton(child: Text("OK!",style: TextStyle(color: Colors.white),), onPressed:() =>Navigator.pop(context) )
                    ]
                  ).show();
                  score = [];
                }
                setState(() {
                  quizbrain.nextqstn();
                });
              },
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
