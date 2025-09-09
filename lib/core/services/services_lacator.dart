import 'package:flutter_movies/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movies/features/movies/data/repository/movies_repo.dart';
import 'package:flutter_movies/features/movies/domain/repository/base_movie_repo.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movie_details_bloc.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLacator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl() , sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));

    sl.registerLazySingleton<BaseMovieRepo>(() => MoviesRepo(sl()));

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
