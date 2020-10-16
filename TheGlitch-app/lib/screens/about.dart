import 'package:chat_bot/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String text = "This app is developed for aiding people in the Covid19 pandemic";
String text1 =
    " and is an open source project. It has many features and many are yet to come";
String text2 =
    " in later versions. Keep using and share feedbacks and suggestions to make it better;";

String url = 'https://github.com/avats-dev/TheGlitch-app';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: kBcolor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black45,
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                  child: Text(
                '$text$text1$text2',
                style: TextStyle(fontSize: 25.0),
              )),
              RaisedButton(
                color: kBcolor,
                child: Text('Project Source Code'),
                onPressed: () async {
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              Text(
                'Stay Safe, Stay Healthy',
                style: TextStyle(fontSize: 25.0),
              ),
            ]),
      ),
    );
  }
}
