import 'package:api_call/src/bloc/base_state.dart';
import 'package:api_call/src/models/detail_movie_response.dart';

abstract class DetailMoviesState extends BaseStateBloc {
  const DetailMoviesState();
}

class DetailMoviesLoading extends DetailMoviesState {
  @override
  List<Object> get props => [];
}

class DetailMoviesLoaded extends DetailMoviesState {
  final DetailMovieResponse detailMovieResponse;
  DetailMoviesLoaded(this.detailMovieResponse);
  @override
  List<Object> get props => [detailMovieResponse];
}

class DetailMoviesError extends DetailMoviesState {
  final String errorMessage;
  DetailMoviesError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
