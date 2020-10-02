
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/bloc/bloc.dart';
import 'src/data/movie_repository.dart';
import 'src/view/discover_movies_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Call',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DiscoverMoviesBloc>(
              create: (context) => DiscoverMoviesBloc(MovieRepository())),
          BlocProvider<DetailMoviesBloc>(
              create: (context) => DetailMoviesBloc(MovieRepository()))
        ],
        child: DiscoverMoviesView(),
      ),
    );
  }
}
