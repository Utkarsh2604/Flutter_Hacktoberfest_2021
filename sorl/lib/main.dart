import 'package:flutter/material.dart';
import 'package:sorl/home_page.dart';

import 'ui_theme/theme_global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyHomePage clickMe = MyHomePage();

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print("It Changed!");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: MyHomePage(title: 'Sword of Concealing Light!'),
      debugShowCheckedModeBanner: false,
    );
  }
}
