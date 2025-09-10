import 'package:dartz/dartz.dart';
import 'package:flutter_movies/core/error/failure.dart';
import 'package:flutter_movies/core/usecase/base_usecase.dart';
import 'package:flutter_movies/features/movies/domain/entities/recommendation.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

class GetMovieRecommendationUsecase
    extends BaseUsecase<List<MovieRecommendation>, int> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieRecommendationUsecase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(
    int parameters,
  ) async {
    return await baseMovieRepo.getRecommendation(parameters);
  }
}
