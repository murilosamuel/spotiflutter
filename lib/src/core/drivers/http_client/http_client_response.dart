class HttpClientResponse<T> {
  final String? data;
  final int? statusCode;
  final String? statusMessage;

  HttpClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
