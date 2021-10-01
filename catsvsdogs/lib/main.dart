import 'package:catsvsdogs/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats VS Dogs',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
