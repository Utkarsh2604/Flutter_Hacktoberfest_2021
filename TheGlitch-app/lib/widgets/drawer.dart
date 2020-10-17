import 'package:chat_bot/constants.dart';
import 'package:chat_bot/screens/useful_link.dart';
import 'package:chat_bot/screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/screens/about.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: kBcolor,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 20.0,
              left: 16.0,
              child: Text("COV-Buddy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
                icon: Icons.inbox,
                text: 'WHO',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyWebView(
                            title: "WHO-Covid",
                            selectedUrl:
                                "https://www.who.int/emergencies/diseases/novel-coronavirus-2019",
                          )));
                }),
            _createDrawerItem(
                icon: Icons.inbox,
                text: 'MOHWF',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyWebView(
                            title: "MOHFW-Covid",
                            selectedUrl: "https://www.mohfw.gov.in/",
                          )));
                }),
            _createDrawerItem(
                icon: Icons.inbox,
                text: 'Vaccince Tracker',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyWebView(
                            title: "Covid Vaccine Tracker",
                            selectedUrl:
                                "https://covid-19tracker.milkeninstitute.org/",
                          )));
                }),
            _createDrawerItem(
                icon: Icons.stars,
                text: 'Useful Links',
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UsefulList()));
                }),
            Divider(),
            _createDrawerItem(
              icon: Icons.info,
              text: 'About',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(title: Text('0.0.1')),
          ],
        ),
      ),
    );
  }
}
