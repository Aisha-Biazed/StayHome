
import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({
    required this.errorMessageModel,
  });
}
class OffLineException implements Exception{
  final ErrorMessageModel errorMessageModel;
  OffLineException(this.errorMessageModel);
}

class LocalDatabaseException implements Exception {
  final String message;
  const LocalDatabaseException({
    required this.message,
  });
}
