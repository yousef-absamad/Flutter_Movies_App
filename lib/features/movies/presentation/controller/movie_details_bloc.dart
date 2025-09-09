import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/core/error/failure.dart';
import 'package:flutter_movies/core/utils/enums.dart';
import 'package:flutter_movies/features/movies/domain/entities/movie_details.dart';
import 'package:flutter_movies/features/movies/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase)
    : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  GetMovieDetailsUsecase getMovieDetailsUsecase;

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUsecase(event.id);

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: failure is ServerFailure
              ? failure.error.message
              : "Unexpected error",
        ),
      ),
      (movieDetails) => emit(
        state.copyWith(
          movieDetails: movieDetails,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
}
