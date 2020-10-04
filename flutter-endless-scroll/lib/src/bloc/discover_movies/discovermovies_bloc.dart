import 'dart:async';
import 'package:api_call/src/data/movie_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc.dart';

class DiscoverMoviesBloc extends Bloc<AppEvent, DiscoverMoviesState> {
  final MovieRepository repos;
  int _page = 1;

  DiscoverMoviesBloc(this.repos) : super(DiscoverMoviesInitial());

  @override
  Stream<Transition<AppEvent, DiscoverMoviesState>> transformEvents(
      Stream<AppEvent> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      transitionFn,
    );
  }

  @override
  Stream<DiscoverMoviesState> mapEventToState(
    AppEvent event,
  ) async* {
    final currentState = state;
    try {
      if (event is GetDiscoverMoviesInitial) {
        _page = 1;
        yield DiscoverMoviesLoading();
        var response = await repos.fetchDiscoverMovies(_page);
        yield DiscoverMoviesLoaded(movieList: response, hasReachedMax: false);
      } else if (event is GetDiscoverMovies &&
          currentState is DiscoverMoviesLoaded &&
          !_hasReachedMax(currentState)) {
        _page++;
        var response = await repos.fetchDiscoverMovies(_page);
        yield response.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : DiscoverMoviesLoaded(
                movieList: currentState.movieList + response,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      yield DiscoverMoviesError(e.toString());
    }
  }

  bool _hasReachedMax(DiscoverMoviesState state) =>
      state is DiscoverMoviesLoaded && state.hasReachedMax;
}
