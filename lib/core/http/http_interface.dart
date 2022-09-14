import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });
}
