import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_extension.dart';
import 'api_url.dart';

abstract class BaseApiCall {
  Future<dynamic> get(String endPoint) async {
    var responseJson;
    try {
      final response = await http.get('$endPoint');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Something wrong with your request');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.post('${ApiUrl.BASE_URL}$url', body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Something wrong with your request');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.put('${ApiUrl.BASE_URL}$url', body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Something wrong with your request');
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var resultResponse = json.decode(response.body);
      return resultResponse;
    case 400:
      throw BadRequestException(response.body);
    case 401:
      throw UnauthorisedException(response.body);
    case 500:
      throw FetchDataException('Error ${response.statusCode}');
  }
}
