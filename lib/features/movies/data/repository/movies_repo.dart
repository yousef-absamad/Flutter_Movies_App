import 'package:dartz/dartz.dart';
import 'package:flutter_movies/core/error/exception.dart';
import 'package:flutter_movies/core/error/failure.dart';
import 'package:flutter_movies/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movies/features/movies/domain/entities/movie.dart';
import 'package:flutter_movies/features/movies/domain/entities/movie_details.dart';
import 'package:flutter_movies/features/movies/domain/entities/recommendation.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

class MoviesRepo extends BaseMovieRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepo(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(int pageNum) async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies(pageNum);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(int pageNum) async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies(pageNum);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int parameters) async {
    try {
      final result = await baseMovieRemoteDataSource.getMovieDetails(
        parameters,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getRecommendation(
    int parameters,
  ) async {
    try {
      final result = await baseMovieRemoteDataSource.getMovieRecommendation(
        parameters,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}
