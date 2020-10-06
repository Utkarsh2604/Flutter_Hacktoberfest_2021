import 'package:flutter/material.dart';
import 'package:wa_clone/ui/chats.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                  child: Container(
                      width: (width * 0.1), child: Icon(Icons.camera_alt))),
              Tab(
                  child: Container(
                      width: (width * 0.9) / 3,
                      child: Text('CHATS', textAlign: TextAlign.center))),
              Tab(
                  child: Container(
                      width: (width * 0.9) / 3,
                      child: Text(' STATUS', textAlign: TextAlign.center))),
              Tab(
                  child: Container(
                      width: (width * 0.9) / 3,
                      child: Text('CALLS', textAlign: TextAlign.center))),
            ],
          ),
          backgroundColor: Color(0xff075E54),
          title: Text(
            'WhatsApp',
            style: TextStyle(),
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.more_vert),
            SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          children: [
            Container(),
            ChatsMenu(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
