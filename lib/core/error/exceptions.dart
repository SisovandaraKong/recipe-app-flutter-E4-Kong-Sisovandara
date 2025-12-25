/// Base exception class for all custom exceptions
class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

/// Exception for server errors
class ServerException extends AppException {
  ServerException([String message = 'Server error occurred']) : super(message);
}

/// Exception for network errors
class NetworkException extends AppException {
  NetworkException([String message = 'No internet connection']) : super(message);
}

/// Exception for cache errors
class CacheException extends AppException {
  CacheException([String message = 'Cache error occurred']) : super(message);
}

/// Exception for database errors
class DatabaseException extends AppException {
  DatabaseException([String message = 'Database error occurred']) : super(message);
}

/// Exception for validation errors
class ValidationException extends AppException {
  ValidationException([String message = 'Validation error']) : super(message);
}
