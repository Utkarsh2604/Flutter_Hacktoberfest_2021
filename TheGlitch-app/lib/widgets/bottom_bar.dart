import 'package:chat_bot/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class BottomBar extends StatelessWidget {
  final String number;
  BottomBar({this.number});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 2.0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('HELP')),
        BottomNavigationBarItem(
            icon: Icon(Icons.group), title: Text('CHATBOT')),
      ],
      backgroundColor: kBcolor,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      onTap: (index) {
        if (index == 0) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.redAccent[700],
              title: Text('HELP'),
              content: Text('Emergency Contact \n$number'),
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.call),
                  onPressed: () => launch("tel:$number"),
                ),
                FlatButton(
                  child: Icon(Icons.message),
                  onPressed: () => launch("sms:$number"),
                ),
              ],
            ),
            barrierDismissible: true,
          );
        } else
          Navigator.pushNamed(context, ChatScreen.id);
      },
    );
  }
}
