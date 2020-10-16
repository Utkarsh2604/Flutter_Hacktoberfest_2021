import 'package:chat_bot/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color(0xff212121),
      ),
      initialRoute: StatusScreen.id,
      routes: {
        ChatScreen.id: (context) => ChatScreen(),
        StatusScreen.id: (context) => StatusScreen(),
      },
    );
  }
}
