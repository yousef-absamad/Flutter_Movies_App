import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/usecase/base_usecase.dart';
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
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
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
    if (state.hasReachedMax) return;
    if (state.popularState == RequestState.loading && event.pageNum != 1) {
      return;
    }

    emit(state.copyWith(popularState: RequestState.loading));

    final result = await getPopularMoviesUsecase(event.pageNum);
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
        final hasReachedMax = movies.isEmpty || movies.length < 20;
        emit(
          state.copyWith(
            popularMovies: event.pageNum == 1
                ? movies
                : [...state.popularMovies, ...movies],
            popularState: RequestState.loaded,
            hasReachedMax: hasReachedMax,
          ),
        );
      },
    );
  }

  Future<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    if (state.hasReachedMax) return;
    if (state.topRatedState == RequestState.loading && event.pageNum != 1) {
      return;
    }

    emit(state.copyWith(topRatedState: RequestState.loading));

    final result = await getTopRatedMoviesUsecase(event.pageNum);
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
        final hasReachedMax = movies.isEmpty || movies.length < 20;
        emit(
          state.copyWith(
            topRatedMovies: event.pageNum == 1
                ? movies
                : [...state.topRatedMovies, ...movies],
            topRatedState: RequestState.loaded,
            hasReachedMax: hasReachedMax,
          ),
        );
      },
    );
  }

  int _getCurrentCount(MovieCategory category) {
    final count = category == MovieCategory.popular
        ? state.popularMovies.length
        : state.topRatedMovies.length;
    return (count ~/ 20) + 1;
  }

  void fetchSeeMoreMovies(MovieCategory category) {
    if (category == MovieCategory.popular) {
      add(GetPopularMoviesEvent(pageNum: _getCurrentCount(category)));
    } else {
      add(GetTopRatedMoviesEvent(pageNum: _getCurrentCount(category)));
    }
  }
}
