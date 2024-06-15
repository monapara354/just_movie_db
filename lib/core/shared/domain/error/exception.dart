class ServerException implements Exception {
  ServerException({required this.error});

  final String error;
}


