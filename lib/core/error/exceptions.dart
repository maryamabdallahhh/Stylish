/// Thrown when the API returns a non-2xx response.
class ServerException implements Exception {
  final String message;
  final int? statusCode;
  const ServerException(this.message, {this.statusCode});
}

/// Thrown when device is offline.
class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'No internet connection.']);
}

/// Thrown when a local cache read/write fails.
class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Local cache error.']);
}

/// Thrown when a 401 is received from the API.
class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException([this.message = 'Unauthorized.']);
}
