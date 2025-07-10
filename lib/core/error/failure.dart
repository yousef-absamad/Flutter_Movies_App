import 'package:flutter_movies/core/network/error_message_model.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final ErrorMessageModel error;
  ServerFailure(this.error);

  String get message => error.message;
}

class DatabaseFailure extends Failure {
  final String message;
  DatabaseFailure(this.message);
}
