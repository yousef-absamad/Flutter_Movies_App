import 'package:dartz/dartz.dart';
import 'package:flutter_movies/core/error/failure.dart';
import 'package:flutter_movies/core/usecase/base_usecase.dart';
import 'package:flutter_movies/features/movies/domain/entities/movie_details.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetails , int> {
  final BaseMovieRepo baseMovieRepo;
  GetMovieDetailsUsecase(this.baseMovieRepo);
  @override
  Future<Either<Failure, MovieDetails>> call(int parameters) async{
    return await baseMovieRepo.getMovieDetails(parameters);
  }
}
