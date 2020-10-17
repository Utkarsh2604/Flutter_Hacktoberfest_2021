import 'package:chat_bot/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/widgets/pie_chart.dart';
import 'package:chat_bot/widgets/bottom_bar.dart';
import 'package:chat_bot/widgets/drawer.dart';

class StatusScreen extends StatefulWidget {
  static String id = 'status_screen';

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final String number = "1075";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Text('COV - Buddy'),
        centerTitle: true,
        backgroundColor: kBcolor,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Pie(),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomBar(number: number),
    );
  }
}
