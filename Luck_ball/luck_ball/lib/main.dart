import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var ballc = 1;
  void ballchange() {
    ballc = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Ask Me Something',
            style: GoogleFonts.dosis(
              fontSize: 30.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      ballchange();
                    });
                  },
                  child: Image.asset('images/ball$ballc.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
