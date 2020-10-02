import 'package:api_call/src/bloc/base_state.dart';
import 'package:api_call/src/models/movie_response.dart';

abstract class DiscoverMoviesState extends BaseStateBloc {
  const DiscoverMoviesState();
}

class DiscoverMoviesInitial extends DiscoverMoviesState {
  @override
  List<Object> get props => [];
}

class DiscoverMoviesLoading extends DiscoverMoviesState {
  const DiscoverMoviesLoading();
  @override
  List<Object> get props => [];
}

class DiscoverMoviesLoaded extends DiscoverMoviesState {
  final List<Movies> movieList;
  final bool hasReachedMax;

  DiscoverMoviesLoaded({this.movieList, this.hasReachedMax});

  DiscoverMoviesLoaded copyWith({List<Movies> moviesList, bool hasReachedMax}) {
    return DiscoverMoviesLoaded(
        movieList: moviesList ?? this.movieList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [movieList, hasReachedMax];
}

class DiscoverMoviesError extends DiscoverMoviesState {
  final String errorMessage;
  DiscoverMoviesError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
