import 'package:flutter_movies/features/movies/domain/entities/recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel({
    required super.backdropPath,
    required super.id,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
    );
  }
}
