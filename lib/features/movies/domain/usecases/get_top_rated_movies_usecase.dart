import 'package:dartz/dartz.dart';
import 'package:flutter_movies/features/movies/domain/entities/movie.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

import '../../../../core/error/failure.dart';

class GetTopRatedMoviesUsecase {
  final BaseMovieRepo baseMovieRepo;
  GetTopRatedMoviesUsecase(this.baseMovieRepo);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
