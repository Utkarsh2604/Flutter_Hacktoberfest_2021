import 'package:flutter/material.dart';

const kBcolor = Color(0xff2C0D43);
//default color
const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  hintText: 'Say Hello...',
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,
  ),
  border: InputBorder.none,
);

const kSettingTextField = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  hintText: 'Type to Change..',
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,
  ),
  border: InputBorder.none,
);

/*
 * constant value for TextField decoration
 * to enable border is on focus ===> edit border: field
 * 
 */

const kMyMessageBubbleStyle = BorderRadius.only(
    bottomRight: Radius.circular(15.0),
    bottomLeft: Radius.circular(15.0),
    topLeft: Radius.circular(15.0));

const kOtherMessageBubbleStyle = BorderRadius.only(
    bottomRight: Radius.circular(15.0),
    bottomLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0));

const kSettingStyle = TextStyle(
  fontSize: 18,
);
