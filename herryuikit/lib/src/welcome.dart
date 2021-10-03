import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  final Widget? title;
  const WelcomePage({ Key? key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:const Text('Belajar'),
      ),
    );
  }
}