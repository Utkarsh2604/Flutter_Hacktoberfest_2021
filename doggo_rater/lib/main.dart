import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:doggo_rater/doggoload.dart';
import 'package:doggo_rater/body.dart';

// flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8989
void main() => runApp(AppHome());

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    'Rate Da FLUFFY BOI',
    'Fluffs doin appreciate. RATE MORE',
    'Ew. RATE THE FLUFFFSSSS',
    'Fluffy boi was heartbroken. BE NICE.',
  ];
  var _qid = 0, _started = false;
  List<int> _scores = [0, 0, 0];
  Orientation _orient;
  var _lOrient = Orientation.portrait;
  Widget _doggo = ImageLoad(true);

  void _answerQuestion(int responseType) {
    setState(() {
      // Rebuilds MyAppState
      if (responseType == 0)
        _qid = 1;
      else if (responseType == 1)
        _qid = 2;
      else if (responseType == 2)
        _qid = 3;
      _scores[_qid - 1]++;
      if (_scores[2] >= 10){
        _doggo = Text(
          '\nYOU HAVE BEEN RIGHTLY RESTRICTED \nFROM USING THIS APP. \n\nPLEASE DO NOT CONTACT THE DEVELOPER.',
          textAlign: TextAlign.center,
          textScaleFactor: 2,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        );
        _scores[_qid - 1]--;
        _qid = 3;
        _scores[_qid - 1] = 10;
      }
      else _doggo = ImageLoad(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    // Set up initial orientation
    if (!_started) {
      _started = true;
      _orient = MediaQuery.of(context).orientation;
    }
    // Track orientation changes in each build
    _lOrient = _orient;
    _orient = MediaQuery.of(context).orientation;

    if (_lOrient != _orient && !(_doggo is Text))
      _doggo = ImageLoad(false);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: _width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text(
                "Positive Ratings: ${_scores[0]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
                Text(
                  "Indecisiveness: ${_scores[1]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Lies: ${_scores[2]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        body: (_orient == Orientation.portrait) ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bodyItems(_questions, _qid, _scores, _answerQuestion, _doggo, _height, _width, 'p'),
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: bodyItems(_questions, _qid, _scores, _answerQuestion, _doggo, _height, _width, 'l'),
          ),
        ),
    );
  }
}
