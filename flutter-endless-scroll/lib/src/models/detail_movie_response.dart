class DetailMovieResponse {
  String backdropPath;
  String title;
  String overview;
  String posterPath;
  String releaseDate;
  String status;
  double voteAverage;
  int voteCount;

  DetailMovieResponse(
      {this.backdropPath,
      this.title,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.status,
      this.voteAverage,
      this.voteCount});

  DetailMovieResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    backdropPath = json['backdrop_path'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    status = json['status'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];
  }
}
