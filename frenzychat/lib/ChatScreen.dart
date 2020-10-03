import 'package:flutter/material.dart';
import 'package:frenzychat/ChatMessage.dart';

class chatScreen extends StatefulWidget {
  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final TextEditingController textcontroller = new TextEditingController();
  final List<chatMessage> messages=[];
  void handlesubmit(String text) {
    textcontroller.clear();
    chatMessage chat=new chatMessage(
      text:text,
    );
    setState(() {
      messages.insert(0, chat);
    });
  }

  Widget textComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
                child: TextField(
              decoration: InputDecoration.collapsed(hintText: "send a message"),
              controller: textcontroller,
              onSubmitted: handlesubmit,
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => handlesubmit(textcontroller.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_,int index)=>messages[index],
                itemCount: messages.length,
              ),
            ),
            Divider(height: 1.0,),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: textComposer(),
            )
          ],
        );
  }
}
