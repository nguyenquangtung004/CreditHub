class ApiException implements Exception {
  ApiException({
    this.httpCode,
    this.status,
    this.error,
    this.message = '',
  });

  final int? httpCode;
  final String? status;
  final String? error;
  final String message;

  @override
  String toString() {
    return message;
  }
}