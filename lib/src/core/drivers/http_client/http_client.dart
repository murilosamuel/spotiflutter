import 'http_client_response.dart';

abstract class HttpClient {
  Future<HttpClientResponse<T>> post<T>(
    String url, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  });

  Future<HttpClientResponse<T>> get<T>(
    String url, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  });

  Future<HttpClientResponse<T>> put<T>(
    String url, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  });

  Future<HttpClientResponse<T>> delete<T>(
    String url, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  });
}
