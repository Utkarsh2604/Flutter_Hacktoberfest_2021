import 'Questions.dart';

class Qbrain {
  int _num = 0;
  List<Qstnbank> _qbank = [
    Qstnbank(q: 'Some cats are actually allergic to humans', a: true),
    Qstnbank(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Qstnbank(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Qstnbank(q: 'A slug\'s blood is green.', a: true),
    Qstnbank(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Qstnbank(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Qstnbank(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Qstnbank(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Qstnbank(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Qstnbank(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Qstnbank(q: 'Google was originally called \"Backrub\".', a: true),
    Qstnbank(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Qstnbank(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true)
  ];
  void reset() {
    _num = 0;
  }

  void nextqstn() {
    if (_num < _qbank.length - 1) {
      _num++;
    }
  }

  String getqstntxt() {
    return _qbank[_num].qtext;
  }

  bool getqstnans() {
    return _qbank[_num].qans;
  }

  bool checkend() {
    if (_num >= _qbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
