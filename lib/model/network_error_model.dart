class NetworkError implements Exception {
  final int statusCode;
  final String message;
  NetworkError({
    required this.message,
    required this.statusCode,
  });
}
