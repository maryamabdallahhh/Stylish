import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constants.dart';
import '../constants/app_constants.dart';
import '../error/exceptions.dart';

/// Singleton Dio HTTP client.
/// Handles base URL, timeouts, auth header injection, and error mapping.
class DioClient {
  late final Dio _dio;

  DioClient({SharedPreferences? prefs}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(prefs: prefs),
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
    ]);
  }

  // ── HTTP methods ─────────────────────────────────────────────────────────────

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _request<T>(() => _dio.get(path, queryParameters: queryParameters, options: options));

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _request<T>(() => _dio.post(path, data: data, queryParameters: queryParameters, options: options));

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Options? options,
  }) =>
      _request<T>(() => _dio.put(path, data: data, options: options));

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Options? options,
  }) =>
      _request<T>(() => _dio.patch(path, data: data, options: options));

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Options? options,
  }) =>
      _request<T>(() => _dio.delete(path, data: data, options: options));

  // ── Error mapper ─────────────────────────────────────────────────────────────

  Future<Response<T>> _request<T>(Future<Response<T>> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  Exception _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Connection timed out.');
      case DioExceptionType.connectionError:
        return NetworkException('No internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) return const UnauthorizedException();
        final message = e.response?.data?['message'] as String? ?? 'Server error.';
        return ServerException(message, statusCode: statusCode);
      default:
        return ServerException(e.message ?? 'Unexpected error.');
    }
  }
}

/// Injects the Bearer token from SharedPreferences into every request.
class AuthInterceptor extends Interceptor {
  final SharedPreferences? prefs;
  AuthInterceptor({this.prefs});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = prefs?.getString(AppConstants.kAccessToken);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: Add token refresh logic here when 401 is received.
    super.onError(err, handler);
  }
}
