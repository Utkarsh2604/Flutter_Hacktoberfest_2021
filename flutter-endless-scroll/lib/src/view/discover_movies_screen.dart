import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../models/movie_response.dart';
import '../utility/global_view.dart';
import 'detail_movie_screen.dart';
import 'movie_item.dart';

class DiscoverMoviesView extends StatefulWidget {
  @override
  _DiscoverMoviesViewState createState() => _DiscoverMoviesViewState();
}

class _DiscoverMoviesViewState extends State<DiscoverMoviesView> {
  DiscoverMoviesBloc _bloc;
  Completer<void> _refreshCompleter;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void getMovies(BuildContext context, bool isFirstLoad) {
    if (isFirstLoad)
      _bloc.add(GetDiscoverMoviesInitial());
    else
      _bloc.add(GetDiscoverMovies());
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<DiscoverMoviesBloc>(context);
    _refreshCompleter = Completer<void>();
    _scrollController.addListener(_onScroll);
    getMovies(context, true);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(GetDiscoverMovies());
    }
  }

  Widget _mapStateHandler(DiscoverMoviesState state) {
    if (state is DiscoverMoviesLoading) {
      return ProgressBar(loadingMessage: 'Get DIscover Movies');
    } else if (state is DiscoverMoviesLoaded) {
      _refreshCompleter?.complete();
      _refreshCompleter = Completer();
      return _movieList(state.hasReachedMax, state.movieList);
    } else if (state is DiscoverMoviesError) {
      _refreshCompleter?.complete();
      _refreshCompleter = Completer();
      return Error(
          errorMessage: state.errorMessage,
          onRetry: () {
            getMovies(context, true);
            return _refreshCompleter.future;
          });
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Movies'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: RefreshIndicator(
          onRefresh: () {
            // TODO: do reload discover movie
            getMovies(context, true);
            return _refreshCompleter.future;
          },
          child: BlocBuilder<DiscoverMoviesBloc, DiscoverMoviesState>(
              builder: (context, state) {
            return _mapStateHandler(state);
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _movieList(bool hasReachedMax, List<Movies> movieList) {
    return ListView.builder(
      itemCount: hasReachedMax ? movieList.length : movieList.length + 1,
      controller: _scrollController,
      itemBuilder: (context, index) {
        return index >= movieList.length
            ? BottomLoader()
            : MovieItem(
                movie: movieList[index],
                onMovieTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<DetailMoviesBloc>(context),
                          child: DetailMovies(movieList[index].id),
                        ),
                      ));
                });
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
