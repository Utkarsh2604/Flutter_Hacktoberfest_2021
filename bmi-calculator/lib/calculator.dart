import 'dart:math';

class Calculator {

  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI () {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults () {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation () {
    if (_bmi >= 25) {
      return 'You have a higher weight than normal. Try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'Good job! You have a normal body weight';
    } else {
      return 'You have a lower body weight than normal. Eat a bit more!';
    }
  }

}