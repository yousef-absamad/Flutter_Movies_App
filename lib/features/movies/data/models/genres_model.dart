import 'package:flutter_movies/features/movies/domain/entities/geners.dart';

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json["id"], name: json["name"]);
  }
}
