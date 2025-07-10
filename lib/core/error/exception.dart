import 'package:flutter_movies/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException(this.errorMessageModel);
}


class DatabaseException implements Exception {
  final String message;

  const DatabaseException(this.message);
}
