import 'package:flutter_movies/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.genreIds,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["original_title"] ?? "",
      imageUrl: json["backdrop_path"] ?? "",
      genreIds: List<int>.from(json["genre_ids"].map((e) => e) ?? []),
      overView: json["overview"] ?? "",
      voteAverage: (json["vote_average"] as num).toDouble(),
      releaseDate: json["release_date"] ?? "",
    );
  }
}
