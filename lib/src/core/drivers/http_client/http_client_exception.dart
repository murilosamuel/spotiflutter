class HttpClientException implements Exception {
  String error;
  String? uri;

  HttpClientException({
    required this.error,
    this.uri,
  });

  @override
  String toString() {
    return 'HttpClientException(error: $error, uri: $uri)';
  }
}
