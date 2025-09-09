import 'package:equatable/equatable.dart';

class MovieRecommendation extends Equatable {
  final String backdropPath;
  final int id;
  const MovieRecommendation({required this.backdropPath, required this.id});

  @override
  List<Object> get props => [backdropPath, id];
}
