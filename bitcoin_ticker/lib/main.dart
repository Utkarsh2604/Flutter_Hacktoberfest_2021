import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'dart:io' show Platform;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Coin Ticker"),
            backgroundColor: Colors.blue,
          ),
          body: ValueDisplay()),
    );
  }
}

class ValueDisplay extends StatefulWidget {
  @override
  _ValueDisplayState createState() => _ValueDisplayState();
}

class _ValueDisplayState extends State<ValueDisplay> {
  String value1 = 'AUD';
  List<String> currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];
  List<DropdownMenuItem> getlistd() {
    List<DropdownMenuItem<String>> items2 = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var item32 = DropdownMenuItem(
          child: Center(child: Text(currenciesList[i])),
          value: currenciesList[i]);
      items2.add(item32);
    }
    return items2;
  }

  List<Text> getlistc() {
    List<Text> list2 = [];
    for (String i in currenciesList) {
      list2.add(Text(i));
    }
    return list2;
  }

  CupertinoPicker buildCupertinoPicker() {
    return CupertinoPicker(
        itemExtent: 40,
        onSelectedItemChanged: (int g) {
          setState(() {
            value1 = currenciesList[g];
            btc = "?";
            eth = "?";
            ltc = "?";
            getResponse(currenciesList[g]);
          });
        },
        children: getlistc());
  }

  DropdownButton<String> buildDropDownPicker() {
    return DropdownButton(
      items: getlistd(),
      onChanged: (String g) {
        setState(() {
          value1 = g;
          btc = "?";
          eth = "?";
          ltc = "?";
          getResponse(g);
        });
      },
      value: value1,
    );
  }

  String btc = "?";
  String eth = "?";
  String ltc = "?";
  Future<void> getResponse(String country) async {
    http.Response responsebtc = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$country',
        headers: {'x-ba-key': 'ZjUzMmE5ZmQ1ZDMxNDFlNTgxYjExZmU5ZjRlMDNjNTk'});
    http.Response responseeth = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/ETH$country',
        headers: {'x-ba-key': 'ZjUzMmE5ZmQ1ZDMxNDFlNTgxYjExZmU5ZjRlMDNjNTk'});
    http.Response responseltc = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/LTC$country',
        headers: {'x-ba-key': 'ZjUzMmE5ZmQ1ZDMxNDFlNTgxYjExZmU5ZjRlMDNjNTk'});
    double responsebtc1 = convert.jsonDecode(responsebtc.body)['last'];
    double responseeth1 = convert.jsonDecode(responseeth.body)['last'];
    double responseltc1 = convert.jsonDecode(responseltc.body)['last'];
    setState(() {
      btc = responsebtc1.toStringAsFixed(0);
      eth = responseeth1.toStringAsFixed(0);
      ltc = responseltc1.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();
    getResponse(value1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: Text(
                    "1 BTC = $btc $value1",
                    style: TextStyle(fontSize: 30.0),
                  )),
                ),
                color: Colors.blue,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: Text(
                    "1 ETH = $eth $value1",
                    style: TextStyle(fontSize: 30.0),
                  )),
                ),
                color: Colors.blue,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: Text(
                    "1 LTC = $ltc $value1",
                    style: TextStyle(fontSize: 30.0),
                  )),
                ),
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 120,
          color: Colors.blue,
          child: Center(
            child:
                Platform.isIOS ? buildCupertinoPicker() : buildDropDownPicker(),
          ),
        )
      ],
    );
  }
}
