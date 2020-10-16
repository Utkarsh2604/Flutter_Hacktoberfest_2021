import 'dart:convert';
import 'package:chat_bot/models/country_code_list.dart';
import 'package:http/http.dart';

const String url = 'https://corona-api.com';

class NetworkHelper {
  final String country;

  NetworkHelper({this.country});

  Future getData() async {
    Response response;

    if (country == 'WorldWide')
      response = await get('$url/timeline');
    else
      response = await get('$url/countries/${CountryCode().getCode(country)}');

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      if (country != 'WorldWide') return decodedData['data']['latest_data'];

      return decodedData['data'][0];
    } else {
      print(response.statusCode);
    }
  }
}
