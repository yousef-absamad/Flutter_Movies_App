import 'package:dartz/dartz.dart';
import 'package:flutter_movies/core/usecase/base_usecase.dart';
import 'package:flutter_movies/features/movies/domain/entities/movie.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

import '../../../../core/error/failure.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<Movie>> {
  final BaseMovieRepo baseMovieRepo;
  GetNowPlayingMoviesUsecase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepo.getNowPlayingMovies();
  }
}
