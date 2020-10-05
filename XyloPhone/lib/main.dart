//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
//import 'package:characters/characters.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int songNum) {
    final player = AudioCache();
    player.play("note$songNum.wav");
  }

  buildButton(int n, Color color) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(n);
        },
        child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildButton(1, Colors.orange),
              buildButton(2, Colors.white),
              buildButton(3, Colors.green),
              buildButton(4, Colors.pinkAccent),
              buildButton(5, Colors.tealAccent),
              buildButton(6, Colors.purple),
              buildButton(7, Colors.blueAccent),
              /* Expanded(
                child: FlatButton(
                  color: Colors.purple,
                  onPressed: () {
                    playSound(2);
                  },
                  child: Text("Click Me"),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    playSound(3);
                  },
                  child: Text("Click Me"),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    playSound(4);
                  },
                  child: Text("Click Me"),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.teal,
                  onPressed: () {
                    playSound(5);
                  },
                  child: Text("Click Me"),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    playSound(6);
                  },
                  child: Text("Click Me"),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    playSound(7);
                  },
                  child: Text("Click Me"),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
