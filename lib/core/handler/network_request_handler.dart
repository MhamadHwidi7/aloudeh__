
  import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:dartz/dartz.dart';

Future<Either<NetworkExceptions, T>> handleNetworkRequest<T>({
    required Future<bool> Function() isConnected,
    required Future<T> Function() apiCall,
  }) async {
    if (await isConnected()) {
      try {
        final response = await apiCall();
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }