import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// 4xx / 5xx HTTP errors returned by the API.
final class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object> get props => [message, statusCode ?? 0];
}

/// Device has no internet connectivity.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

/// Something went wrong parsing / mapping the response.
final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local cache error.']);
}

/// Authentication token expired or invalid.
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Session expired. Please log in again.']);
}

/// Generic fallback.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'An unexpected error occurred.']);
}
