import 'package:flutter_movies/features/movies/domain/entities/movie.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

class GetTopRatedMoviesUsecase {
  final BaseMovieRepo baseMovieRepo;
  GetTopRatedMoviesUsecase(this.baseMovieRepo);

  Future<List<Movie>> excute() async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
