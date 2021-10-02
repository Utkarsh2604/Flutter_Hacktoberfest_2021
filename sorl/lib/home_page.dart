import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui_theme/theme_global.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  incrementCounter() {
    setState(() {
      currentTheme.switchTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          currentTheme.isDark ? widget.title : 'Sword of Revealing Light!',
          style: TextStyle(
            color: currentTheme.isDark ? Colors.white : Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors
            .transparent, // Does not show line under appBar when changing to light theme.
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  incrementCounter();
                },
                child: currentTheme.isDark
                    ? Image.asset("assets/images/socl.gif")
                    : Image.asset(
                        "assets/images/sorl.gif",
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
