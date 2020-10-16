import 'package:chat_bot/constants.dart';
import 'package:chat_bot/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/models/chat_data.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_sreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatList chatData = ChatList();

  var _controller = TextEditingController();
  String resultText;

  WatsonAssistantV2Credential credential = WatsonAssistantV2Credential(
    version: '2020-04-01',
    username: 'apikey',
    apikey: 'jKzP6qjLQg48mlERQwb6bSXsxigua8S5wZogEsIFNHhK',
    assistantID: 'fa0bb7fa-a3b1-4d29-81b2-ba7fa2e70eab',
    url:
        'https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/0f1a51ae-8838-4c10-b0de-b14bdcabdcdc/v2',
  );

  WatsonAssistantApiV2 watsonAssistant;
  WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
      WatsonAssistantContext(context: {});

  void _callWatsonAssistant() async {
    watsonAssistantResponse =
        await watsonAssistant.sendMessage(resultText, watsonAssistantContext);
    setState(() {
      String text = watsonAssistantResponse.resultText;
      chatData.addChat(text, false);
    });
    watsonAssistantContext = watsonAssistantResponse.context;
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant =
        WatsonAssistantApiV2(watsonAssistantCredential: credential);
    _callWatsonAssistant();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        backgroundColor: kBcolor,
        title: Text('COV - Buddy'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(child: AllChat(chatList: chatData.chatList)),
            Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                      decoration: BoxDecoration(
                        color: kBcolor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            resultText = value;
                          });
                        },
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                  ),
                  MyButton(
                    icon: Icons.send,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      print(resultText);
                      _controller.clear();
                      setState(() {
                        chatData.addChat(resultText, true);
                        _callWatsonAssistant();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
