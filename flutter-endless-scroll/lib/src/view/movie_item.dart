import 'package:api_call/src/data/api_url.dart';
import 'package:flutter/material.dart';

import '../models/movie_response.dart';

class MovieItem extends StatelessWidget {
  final Movies movie;
  final GestureTapCallback onMovieTap;

  MovieItem({@required this.movie, this.onMovieTap});
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: GestureDetector(
        onTap: onMovieTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: _size.width,
                  height: 200,
                  child: Image.network(
                    '${ApiUrl.IMAGE_URL}${movie.backdropPath}',
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 4.0),
              Container(
                margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Date Release: ${movie.releaseDate}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
