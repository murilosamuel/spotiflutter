import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'http_client.dart';
import 'http_client_exception.dart';
import 'http_client_response.dart';

@Injectable(as: HttpClient)
class HttpRequestClient implements HttpClient {
  final Client http;
  final LocalStorage storage;

  HttpRequestClient(
    this.http,
    this.storage,
  );

  @override
  Future<HttpClientResponse<T>> get<T>(
    String url, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    print('GET: $url');
    try {
      final query = queryParameters != null
          ? '?${Uri(queryParameters: queryParameters).query}'
          : '';
      final response = await http.get(
        Uri.parse(
          '$url$query',
        ),
        headers: headers,
      );
      return HttpClientResponse(
        data: response.body,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpClientException(
        error: e.message,
        uri: e.uri.toString(),
      );
    } catch (e) {
      throw HttpClientException(
        error: e.toString(),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> put<T>(
    String url, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final query = queryParameters != null
          ? '?${Uri(queryParameters: queryParameters).query}'
          : '';

      final response = await http.put(
        Uri.parse(
          '$url$query',
        ),
        headers: headers,
        body: body,
      );
      return HttpClientResponse(
        data: response.body,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpClientException(
        error: e.message,
        uri: e.uri.toString(),
      );
    } catch (e) {
      throw HttpClientException(
        error: e.toString(),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> delete<T>(
    String url, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final query = queryParameters != null
          ? '?${Uri(queryParameters: queryParameters).query}'
          : '';

      final response = await http.delete(
        Uri.parse(
          '$url$query',
        ),
        headers: headers,
        body: body,
      );
      return HttpClientResponse(
        data: response.body,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpClientException(
        error: e.message,
        uri: e.uri.toString(),
      );
    } catch (e) {
      throw HttpClientException(
        error: e.toString(),
      );
    }
  }

  @override
  Future<HttpClientResponse<T>> post<T>(
    String url, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final query = queryParameters != null
          ? '?${Uri(queryParameters: queryParameters).query}'
          : '';

      final response = await http.post(
        Uri.parse(
          '$url$query',
        ),
        headers: headers,
        body: body as Map<String, dynamic>,
      );
      return HttpClientResponse(
        data: response.body,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpClientException(
        error: e.message,
        uri: e.uri.toString(),
      );
    } catch (e) {
      throw HttpClientException(
        error: e.toString(),
      );
    }
  }
}
