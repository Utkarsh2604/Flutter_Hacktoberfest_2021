import 'dart:collection';
import 'package:chat_bot/models/chat.dart';
import 'package:chat_bot/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatList {
  List<Chat> _chatList = [];

  UnmodifiableListView<Chat> get chatList => UnmodifiableListView(_chatList);

  void addChat(String message, bool isMe) {
    _chatList.add(Chat(text: message, sender: isMe));
  }
}

class AllChat extends StatelessWidget {
  final chatList;
  AllChat({this.chatList});

  @override
  Widget build(BuildContext context) {
    List<MessageBubble> M = [];

    for (Chat c in chatList) {
      String text = c.text;
      bool isMe = c.sender;

      final message = MessageBubble(
        text: text,
        isMe: isMe,
      );
      M.add(message);
    }
    return ListView(
      children: M,
    );
  }
}
