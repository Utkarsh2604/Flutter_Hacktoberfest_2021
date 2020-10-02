import 'dart:async';
import 'package:api_call/src/data/movie_repository.dart';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class DetailMoviesBloc extends Bloc<AppEvent, DetailMoviesState> {
  final MovieRepository repos;
  DetailMoviesBloc(this.repos) : super(DetailMoviesLoading());

  @override
  Stream<DetailMoviesState> mapEventToState(
    AppEvent event,
  ) async* {
    yield DetailMoviesLoading();

    if (event is GetDetailMovies) {
      try {
        var response = await repos.fetchDetailMovies(event.movieId);
        yield DetailMoviesLoaded(response);
      } catch (e) {
        yield DetailMoviesError(e.toString());
      }
    }
  }
}
