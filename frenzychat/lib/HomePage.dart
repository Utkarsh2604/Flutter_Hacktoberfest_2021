import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'ChatMessage.dart';

class myHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frenzy app"),
        ),
        body: chatScreen()
        );
  }
}
