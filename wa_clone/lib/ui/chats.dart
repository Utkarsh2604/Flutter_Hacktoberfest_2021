import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(),
          Fab(),
        ],
      ),
    );
  }
}

/// Floating Action Button di Chats
class Fab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: FloatingActionButton(
          elevation: 5,
          backgroundColor: Color(0xff25D366),
          child: Icon(Icons.message),
          onPressed: () {
            Get.bottomSheet(Column(
              children: [TextField()],
            ));
          }),
    );
  }
}
