import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:doggo_rater/questions.dart';
import 'package:doggo_rater/answers.dart';

List<Widget> bodyItems(List<String> _questions, int _qid, List<int> _scores, Function(int) _answerQuestion, Widget _doggo, double _height, double _width, String o) {
  return [
    Flexible(flex: 1, child: Container(
      width: double.infinity,
      child: Column(children: <Widget>
      [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
          child: Questions(_questions[_qid],),
        ),
        Align(alignment: Alignment.bottomCenter, child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _height / 2,
          child: _doggo,
        )),
      ]
      ),
    ),
    ),
    if (!(_doggo is Text))
    (o == 'p') ?
    Container(width: double.infinity, child: Answers(_answerQuestion))
        :
    Flexible(flex: 1, child: Container(height: double.infinity, width: double.infinity, child: Answers(_answerQuestion))),
  ];
}