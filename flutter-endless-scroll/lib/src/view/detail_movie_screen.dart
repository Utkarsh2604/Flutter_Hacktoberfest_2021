import 'dart:async';

import 'package:api_call/src/data/api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../models/detail_movie_response.dart';
import '../utility/global_view.dart';

class DetailMovies extends StatefulWidget {
  final int movieId;
  DetailMovies(this.movieId);
  @override
  _DetailMoviesState createState() => _DetailMoviesState();
}

class _DetailMoviesState extends State<DetailMovies> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<DetailMoviesBloc>(context)
        .add(GetDetailMovies(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Movies'),
      ),
      body: BlocBuilder<DetailMoviesBloc, DetailMoviesState>(
        builder: (context, state) {
          if (state is DetailMoviesLoading) {
            return ProgressBar(loadingMessage: 'Get Detail Movies');
          } else if (state is DetailMoviesLoaded) {
            return DetailMovieView(state.detailMovieResponse);
          } else if (state is DetailMoviesError) {
            return Error(
                errorMessage: state.errorMessage,
                onRetry: () {
                  getDetailMovies(context);
                  return _refreshCompleter.future;
                });
          }
          return Container();
        },
      ),
    );
  }

  void getDetailMovies(BuildContext context) {
    // ignore: close_sinks
    final detailMoviesBloc = BlocProvider.of<DetailMoviesBloc>(context);
    detailMoviesBloc.add(GetDetailMovies(widget.movieId));
  }
}

class DetailMovieView extends StatelessWidget {
  final DetailMovieResponse detailResponse;

  DetailMovieView(this.detailResponse);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              width: size.width,
              height: 200,
              child: Image.network(
                "${ApiUrl.IMAGE_URL}${detailResponse.backdropPath}",
                fit: BoxFit.cover,
              )),
          Container(
            margin: EdgeInsets.fromLTRB(8, 12, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  detailResponse.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(detailResponse.overview),
                SizedBox(height: 12),
                Text('Date Release: ${detailResponse.releaseDate}')
              ],
            ),
          )
        ],
      ),
    );
  }
}
