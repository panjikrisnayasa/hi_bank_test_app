import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/network/exceptions.dart';
import 'package:hi_bank_test_app/app/network/network_config.dart';

class HttpClient {
  HttpClient(this._config) {
    final options = BaseOptions(
      baseUrl: Uri(
        scheme: _config.apiScheme,
        host: _config.apiHost,
      ).toString(),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        Headers.acceptHeader: Headers.jsonContentType,
      },
    );
    _dio = Dio(options);
  }

  static final provider = Provider(
    (ref) {
      return HttpClient(ref.watch(NetworkConfig.provider));
    },
  );

  static const formUrlEncodedContentType = Headers.formUrlEncodedContentType;

  late final NetworkConfig _config;

  late final Dio _dio;

  Future<T> get<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    final response = await _transformError(() async {
      return _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          responseType: responseType.toDioResponseType(),
          sendTimeout: timeoutOptions?.sendTimeout,
          receiveTimeout: timeoutOptions?.receiveTimeout,
        ),
      );
    });

    return response.data!;
  }

  Future<T> post<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    final response = await _transformError(() async {
      return _dio.post<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: contentType,
          responseType: responseType.toDioResponseType(),
          sendTimeout: timeoutOptions?.sendTimeout,
          receiveTimeout: timeoutOptions?.receiveTimeout,
        ),
        data: body,
      );
    });

    return response.data!;
  }

  Future<T> patch<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    final response = await _transformError(() async {
      return _dio.patch<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: contentType,
          responseType: responseType.toDioResponseType(),
          sendTimeout: timeoutOptions?.sendTimeout,
          receiveTimeout: timeoutOptions?.receiveTimeout,
        ),
        data: body,
      );
    });

    return response.data!;
  }

  Future<T> put<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    final response = await _transformError(() async {
      return _dio.put<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: contentType,
          responseType: responseType.toDioResponseType(),
          sendTimeout: timeoutOptions?.sendTimeout,
          receiveTimeout: timeoutOptions?.receiveTimeout,
        ),
        data: body,
      );
    });

    return response.data!;
  }

  Future<T> delete<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    final response = await _transformError(() async {
      return _dio.delete<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: contentType,
          responseType: responseType.toDioResponseType(),
          sendTimeout: timeoutOptions?.sendTimeout,
          receiveTimeout: timeoutOptions?.receiveTimeout,
        ),
        data: body,
      );
    });

    return response.data!;
  }

  Future<Response<T>> _transformError<T>(
    Future<Response<T>> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();

      return response;
    } on DioException catch (e) {
      switch (e.type) {
        case DioException.connectionTimeout:
        case DioException.receiveTimeout:
        case DioException.sendTimeout:
          throw ConnectionTimeoutException();
        case DioExceptionType.badResponse:
          throw HttpStatusCodeException(
            statusCode:
                e.response?.statusCode ?? HttpStatus.internalServerError,
            data: switch (e.response?.data) { final T t => t, _ => null },
          );
        case DioExceptionType.unknown:
          final error = e.error;
          if (error is SocketException) {
            throw error;
          } else if (error is Object) {
            throw error;
          }
          rethrow;
        default:
          rethrow;
      }
    }
  }
}

class TimeoutOptions {
  TimeoutOptions({
    this.sendTimeout,
    this.receiveTimeout,
  });

  Duration? sendTimeout;

  Duration? receiveTimeout;
}

class HttpResponse<T> {
  HttpResponse({
    required this.headers,
    required this.data,
  });

  final Map<String, List<String>> headers;
  final T data;
}

enum HttpResponseType {
  /// Transform the response data to JSON object only when the
  /// content-type of response is "application/json" .
  json,

  /// Get the response stream without any transformation. The
  /// Response data will be a `ResponseBody` instance.
  stream,

  /// Transform the response data to a String encoded with UTF8.
  plain,

  /// Get original bytes, the type of [Response.data] will be List<int>
  bytes
}

extension _DioHttpResonseTypeMapper on HttpResponseType {
  ResponseType toDioResponseType() {
    switch (this) {
      case HttpResponseType.json:
        return ResponseType.json;
      case HttpResponseType.stream:
        return ResponseType.json;
      case HttpResponseType.plain:
        return ResponseType.json;
      case HttpResponseType.bytes:
        return ResponseType.bytes;
    }
  }
}
