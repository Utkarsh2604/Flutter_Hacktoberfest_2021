import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class GetDiscoverMoviesInitial extends AppEvent {
  @override
  List<Object> get props => [Object()];
}

class GetDiscoverMovies extends AppEvent {
  @override
  List<Object> get props => [Object()];
}

class GetDetailMovies extends AppEvent {
  final int movieId;
  GetDetailMovies(this.movieId);
  @override
  List<Object> get props => [movieId];
}
