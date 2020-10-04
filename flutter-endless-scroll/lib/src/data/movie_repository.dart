import 'package:api_call/src/models/detail_movie_response.dart';
import 'package:api_call/src/models/movie_response.dart';

import 'api_url.dart';
import 'base_api_call.dart';

class MovieRepository extends BaseApiCall {
  Future<List<Movies>> fetchDiscoverMovies(int page) async {
    final response = await get(
        "${ApiUrl.DISCOVER_MOVIES}api_key=${ApiUrl.TOKEN}&sort_by=popularity.desc&page=$page");
    return MovieResponse.fromJson(response).moviesList;
  }

  Future<DetailMovieResponse> fetchDetailMovies(int movieId) async {
    final response =
        await get("${ApiUrl.DETAIL_MOVIES}$movieId?api_key=${ApiUrl.TOKEN}");
    return DetailMovieResponse.fromJson(response);
  }
}
