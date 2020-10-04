import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchImg() async {
  final response = await http.get('https://dog.ceo/api/breeds/image/random');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body)['message'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

class ImageLoad extends StatelessWidget {
  final bool _genNew;
  static String _currImage;

  ImageLoad(this._genNew);

  @override
  Widget build(BuildContext context) {
    return (_genNew) ?
    FutureBuilder<String>(
      future: fetchImg(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _currImage = snapshot.data;
          return Image.network(
              _currImage,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                if (loadingProgress == null)
                  return child;
                return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                );
              }
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator(backgroundColor: Colors.black,);
      },
    )
    :
    Image.network(
        _currImage,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
          if (loadingProgress == null)
            return child;
          return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
              )
          );
        }
    );
  }
}
