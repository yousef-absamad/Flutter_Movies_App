import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/utils/enums.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_event.dart';
import 'package:flutter_movies/features/movies/presentation/controller/movies_state.dart';

import '../../../../core/error/failure.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUsecase();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: failure is ServerFailure
                ? failure.error.message
                : 'Unexpected error',
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            nowPlayingMovies: movies,
            nowPlayingState: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUsecase();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: failure is ServerFailure
                ? failure.error.message
                : 'Unexpected error',
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            popularMovies: movies,
            popularState: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUsecase();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure is ServerFailure
                ? failure.error.message
                : 'Unexpected error',
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            topRatedMovies: movies,
            topRatedState: RequestState.loaded,
          ),
        );
      },
    );
  }
}
