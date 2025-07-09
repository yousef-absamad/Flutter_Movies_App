import 'package:flutter_movies/features/movies/domain/entities/movie.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMovieRepo baseMovieRepo;
  GetNowPlayingMoviesUsecase(this.baseMovieRepo);

  Future<List<Movie>> excute() async {
    return await baseMovieRepo.getNowPlayingMovies();
  }
}
