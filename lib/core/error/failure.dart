import 'package:flutter/foundation.dart';

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;
  final String? label;

  Failure({required this.message, this.stackTrace, this.label}) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace, label: label);
    }
  }

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class DatasourceException extends Failure {
  DatasourceException({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}

class NetworkException extends Failure {
  NetworkException({
    required String message,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          label: label,
        );
}
