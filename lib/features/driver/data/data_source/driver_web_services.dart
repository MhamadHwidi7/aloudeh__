import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/base_place_directions_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/driver_profile_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/log_in_driver_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/edit_profile_params.dart';
import 'package:aloudeh_company/features/driver/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/driver/data/params/log_in_driver_params.dart';
import 'package:aloudeh_company/features/driver/data/params/shortest_path_params.dart';
import 'package:aloudeh_company/features/driver/data/params/update_location_driver_params.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:injectable/injectable.dart';

abstract class DriverBaseWebServices{
    Future<LogInDriverEntity> logIn({required LogInDriverParams logInDriverParams});
               Future<BasePaginationEntity<PaginationEntity<MyTripsPaginatedEntity>>>
      getAllMyTrips(PaginatedParams paginatedParams);
          Future<GetBranchLocationEntity> getBranchLocation({required GetBranchLocationParams getBranchLocationParams});
          Future<BaseDriverProfileEntity> getDriverProfile();
          Future<BasePlaceDirectionsEntity> getShortestPath(ShortestPathParams shortestPathParams);
          Future<BaseEntity> updateeLocationDriver(UpdateLocationDriverParams updateLocationDriverParams);
          Future<BaseEntity> editDriverProfile(EditDriverProfileParams editDriverProfileParams);

}
@Singleton(as:DriverBaseWebServices )
class DriverWebServicesImpl implements DriverBaseWebServices{
  final ApiConsumer _apiConsumer;

  DriverWebServicesImpl({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;
  
  @override
  Future<LogInDriverEntity> logIn({required LogInDriverParams logInDriverParams}) async{
    final response = await _apiConsumer.post(EndPoints.driverLogIn,
        queryParameters: logInDriverParams.toJson());
    return LogInDriverEntity.fromJson(response);
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<MyTripsPaginatedEntity>>> getAllMyTrips(PaginatedParams paginatedParams) async{
       return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getMyTripsDriver,
        queryParameters: paginatedParams.toJson(),
           ),
        (json) => MyTripsPaginatedEntity.fromJson(json));
  }
     Future<BasePaginationEntity<PaginationEntity<T>>> _getResultWithPagination<T>(
      Future<dynamic> Function() api, T Function(dynamic json) fromJson) async {
    var response = await api();

    return BasePaginationEntity.fromJson(
      response,
      (paginated) => PaginationEntity.fromJson(
        paginated,
        (data) => fromJson(data),
      ),
    );
  }
  
  @override
  Future<GetBranchLocationEntity> getBranchLocation({required GetBranchLocationParams getBranchLocationParams}) async{
final response = await _apiConsumer.get("${EndPoints.getBranchlatlngDriver}/${getBranchLocationParams.branchId}");
return GetBranchLocationEntity.fromJson(response);
  }
  
  @override
  Future<BaseDriverProfileEntity> getDriverProfile() async{
final response = await _apiConsumer.get(EndPoints.getProfileDriver);
return BaseDriverProfileEntity.fromJson(response);
  }
  
  @override
  Future<BasePlaceDirectionsEntity> getShortestPath(ShortestPathParams shortestPathParams) async{
final response = await _apiConsumer.get(EndPoints.googleMapShortestPathApi,queryParameters: shortestPathParams.toJson());
return BasePlaceDirectionsEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> updateeLocationDriver(UpdateLocationDriverParams updateLocationDriverParams) async{
    final response = await _apiConsumer.post(EndPoints.updateLocationDriver,
        body: updateLocationDriverParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> editDriverProfile(EditDriverProfileParams editDriverProfileParams) async{
      final response = await _apiConsumer.post(EndPoints.editDriverProfile,
        body: editDriverProfileParams.toJson());
    return BaseEntity.fromJson(response);
  }
}