import 'dart:convert';
import 'dart:io';

import 'package:aloudeh_company/core/error/error_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions implements Exception{
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;
  const factory NetworkExceptions.badRequest() = BadRequest;
  const factory NetworkExceptions.badResponse(String reason) = BadResponse;
  const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkExceptions.notAcceptable() = NotAcceptable;
  const factory NetworkExceptions.requestTimeout() = RequestTimeout;
  const factory NetworkExceptions.sendTimeout() = SendTimeout;
  const factory NetworkExceptions.unprocessableEntity(String reason) =
      UnprocessableEntity;
  const factory NetworkExceptions.conflict() = Conflict;
  const factory NetworkExceptions.internalServerError() =
      InternalServerError;
  const factory NetworkExceptions.notImplemented() = NotImplemented;
  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  const factory NetworkExceptions.formatException() = FormatException;
  const factory NetworkExceptions.unableToProcess() = UnableToProcess;
  const factory NetworkExceptions.defaultError(String error) = DefaultError;
  static NetworkExceptions handleResponse(Response? response) {
   ErrorModel errorModel;
  
  if (response?.data is String) {
    Map<String, dynamic> responseData = json.decode(response!.data);
    errorModel = ErrorModel.fromJson(responseData);
  } else {
    errorModel = ErrorModel.fromJson(response?.data);
  }

 
    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
        return NetworkExceptions.badResponse(errorModel.message);
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest(errorModel.message);
      case 404:
        return NetworkExceptions.notFound(errorModel.message);
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 422:
        return NetworkExceptions.unprocessableEntity(errorModel.message);
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        return NetworkExceptions.defaultError(
          "Received invalid status code: $statusCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return const NetworkExceptions.requestCancelled();
            case DioExceptionType.receiveTimeout:
              return const NetworkExceptions.requestTimeout();
            case DioExceptionType.sendTimeout:
              return const NetworkExceptions.sendTimeout();
            case DioExceptionType.receiveTimeout:
              return const NetworkExceptions.sendTimeout();
            case DioExceptionType.badResponse:
              return handleResponse(error.response);
            default:
              return NetworkExceptions.defaultError(error.toString());
          }
        } else if (error is SocketException) {
          return const NetworkExceptions.noInternetConnection();
        } else {
          return NetworkExceptions.defaultError(error.toString());
        }
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.defaultError(error.toString());
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    return networkExceptions.when(
      notImplemented: () => "Not Implemented",
      requestCancelled: () => "Request Cancelled",
      internalServerError: () => "Internal Server Error",
      notFound: (reason) => reason,
      serviceUnavailable: () => "Service unavailable",
      methodNotAllowed: () => "Method Not Allowed",
      badRequest: () => "Please check your info",
      unauthorizedRequest: (error) => error,
      unprocessableEntity: (error) => error,
      requestTimeout: () => "Connection request timeout",
      noInternetConnection: () => "No internet connection",
      conflict: () => "Error due to a conflict",
      sendTimeout: () => "Send timeout in connection with API server",
      unableToProcess: () => "Unable to process the data",
      defaultError: (error) => error,
      formatException: () => "Unexpected error occurred",
      notAcceptable: () => "Not acceptable",
      badResponse: (error) => error,
    );
  }
}
