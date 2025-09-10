import 'package:dio/dio.dart';
import 'package:flutter_movies/core/error/exception.dart';
import 'package:flutter_movies/core/network/error_message_model.dart';
import 'package:flutter_movies/features/movies/data/models/movie_details_model.dart';
import 'package:flutter_movies/features/movies/data/models/movie_model.dart';
import 'package:flutter_movies/features/movies/data/models/recommendationModel.dart';
import 'package:flutter_movies/features/movies/domain/entities/recommendation.dart';

import '../../../../core/network/api_constance.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int parameters);
  Future<List<MovieRecommendation>> getMovieRecommendation(int parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int parameters) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendation>> getMovieRecommendation(
    int parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.movieRecommendationPath(parameters),
    );
    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieRecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
