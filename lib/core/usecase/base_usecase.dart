import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movies/core/error/failure.dart';

abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
