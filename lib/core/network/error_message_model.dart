import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String errorMessage;
  final bool result;

  const ErrorMessageModel({
    required this.errorMessage,
    required this.result,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      errorMessage: json["errorMessage"],
      result: json["result"],
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        result,
      ];
}
