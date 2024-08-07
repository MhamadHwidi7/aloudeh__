// import 'dart:convert';

// import 'package:aloudeh_company/core/api/api_consumer.dart';
// import 'package:aloudeh_company/core/api/end_points.dart';
// import 'package:aloudeh_company/core/api/logging_interceptor.dart';
// import 'package:aloudeh_company/core/constants/strings_constants.dart';
// import 'package:aloudeh_company/injection.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';


// @Singleton(as: ApiConsumer)
// class DioConsumer implements ApiConsumer {
//   DioConsumer(
//     this._client,
//   ) {
//     _client.options
//       ..sendTimeout = const Duration(seconds: 10)
//       ..connectTimeout = const Duration(seconds: 30)
//       ..receiveTimeout = const Duration(seconds: 60)
//       ..baseUrl = EndPoints.baseUrl
//       ..responseType = ResponseType.plain
//       ..followRedirects = true;
//     if (kDebugMode) {
//       _client.interceptors.add(
//         getIt<LoggingInterceptor>(),
//       );
//     }
//   }
//   final Dio _client;
//   late Map<String, String> _headers;

//   void setHeaders() async {
//     _headers = {
//       StringsConstants.accept: StringsConstants.applicationJson,
//       StringsConstants.contentType: StringsConstants.applicationJson,
//     StringsConstants.authorization:"Bearer "
//     };
//   }

//   @override
//   Future get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//   }) async {
//     setHeaders();

//     try {
//       final Response response = await _client.get(
//         path,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         options: Options(
//           headers: _headers,
//         ),
//       );
//       return _handleResponseAsJson(response);
//     } catch (error) {
//       rethrow;
//     }
//   }

//   @override
//   Future post(
//     String path, {
//     dynamic body,
//     String? token,
//     FormData? formData,
//     ResponseType? responseType,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     setHeaders();

//     try {
//       final Response response = await _client.post(
//         path,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: _headers,
//           contentType:
//               formData == null ? StringsConstants.jsonContentType : null,
//           responseType: responseType,
//         ),
//         data: formData ?? body,
//       );
//       return _handleResponseAsJson(response);
//     } catch (error) {
//       rethrow;
//     }
//   }

//   @override
//   Future put(
//     String path, {
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     setHeaders();
//     try {
//       final Response response = await _client.put(
//         path,
//         queryParameters: queryParameters,
//         data: body,
//         options: Options(
//           headers: _headers,
//           contentType: StringsConstants.jsonContentType,
//         ),
//       );
//       return _handleResponseAsJson(response);
//     } catch (error) {
//       rethrow;
//     }
//   }

//   dynamic _handleResponseAsJson(Response response) {
//     final responseJson = jsonDecode(response.data.toString());
//     return responseJson;
//   }

//   @override
//   Future delete(String path,
//       {Map<String, dynamic>? body,
//       Map<String, dynamic>? queryParameters}) async {
//     setHeaders();

//     try {
//       final Response response = await _client.delete(
//         path,
//         data: body,
//         options: Options(
//           headers: _headers,
//           contentType: StringsConstants.jsonContentType,
//         ),
//       );
//       return _handleResponseAsJson(response);
//     } catch (error) {
//       rethrow;
//     }
//   }
// }


//!Mark : check the code in this new optimize 
import 'dart:convert';

import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:aloudeh_company/core/api/logging_interceptor.dart';
import 'package:aloudeh_company/core/constants/strings_constants.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  DioConsumer(
    this._client,
  ) {
    _client.options
      ..sendTimeout = const Duration(seconds: 10)
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 60)
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true;

    if (kDebugMode) {
      _client.interceptors.add(getIt<LoggingInterceptor>());
    }
  }

  final Dio _client;
  final Map<String, String> _headers = {
    StringsConstants.accept: StringsConstants.applicationJson,
    StringsConstants.contentType: StringsConstants.applicationJson,
    StringsConstants.authorization: "Bearer ${SharedPreferencesUtils().getToken()}",
        // StringsConstants.authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzIwNDMyNDY4LCJleHAiOjE3MjA1MTg4NjgsIm5iZiI6MTcyMDQzMjQ2OCwianRpIjoiaG95Q01nUjdySDY2UjFJYyIsInN1YiI6IjEiLCJwcnYiOiI5MTljMzI2ZDQzYWIxNTE5YThiYTNiODU4NmI2ODc1MmU4YzgzODA3In0.8abxluZ5y4W7qyl8bw3ZEOeJqZ--GYF9hIXWHa6Js44",

  };

  Options get _defaultOptions => Options(headers: _headers);

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    return _request(
      () => _client.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: _defaultOptions,
      ),
    );
  }

  @override
  Future post(
    String path, {
    dynamic body,
    String? token,
    FormData? formData,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = _defaultOptions.copyWith(
      contentType: formData == null ? StringsConstants.jsonContentType : null,
      responseType: responseType,
    );

    return _request(
      () => _client.post(
        path,
        queryParameters: queryParameters,
        options: options,
        data: formData ?? body,
      ),
    );
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request(
      () => _client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: _defaultOptions,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request(
      () => _client.delete(
        path,
        data: body,
        options: _defaultOptions,
      ),
    );
  }

  Future _request(Future<Response> Function() request) async {
    try {
      final response = await request();
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  dynamic _handleResponseAsJson(Response response) {
    return jsonDecode(response.data.toString());
  }
}
