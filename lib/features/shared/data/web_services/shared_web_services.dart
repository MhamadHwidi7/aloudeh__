import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/enum/role_enum.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/close_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/driver_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_branch_details_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_role_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/shipping_type_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/forget_password_params.dart';
import 'package:aloudeh_company/features/shared/data/params/get_branch_details_params.dart';
import 'package:aloudeh_company/features/shared/data/params/manifest_params.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:aloudeh_company/features/shared/data/params/trip_information_params.dart';
import 'package:aloudeh_company/features/shared/data/params/truck_information_params.dart';
import 'package:aloudeh_company/features/shared/data/web_services/end_points.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_all_good_paginated_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class SharedBaseWebServices {
  Future<RoleEntity> getRole();
  Future<String> getRoleSpecificEndpoint(String endpointKey);
  Future<BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity>>>
      getAllGoodPaginated(int page);
       Future<BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedSharedEntity>>>
      getAllActiveTrips(PaginatedParams paginatedParams);
       Future<BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedSharedEntity>>>
      getAllBranches(PaginatedParams paginatedParams);
              Future<
          BasePaginationEntity<
              PaginationEntity<TypePaginatedSharedEntity>>>
      shippingPriceList(PaginatedParams paginatedParams);
             Future<
          BasePaginationEntity<
              PaginationEntity<ClosedTripsPaginatedSharedEntity>>>
      getAllClosedTrips(PaginatedParams paginatedParams);
        Future<GetTripInformationSharedEntity> getTripInformation(
      TripInformationSharedParams tripInformationSharedParams);
  Future<BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedSharedEntity>>>
      getAllArchiveTrips(PaginatedParams paginatedParams);
  Future<BasePaginationEntity<PaginationEntity<TruckRecordPaginatedSharedEntity>>>
      getAllTruckRecordPaginated(PaginatedParams paginatedParams);

 Future<GetTruckInformationSharedEntity> getTruckInformation(
      TruckInformationSharedParams truckInformationSharedParams);
  Future<GetManifestSharedEntity> getManifest(ManifestSharedParams manifestSharedParams);
    Future<BaseDriverSharedEntity> getAllDrivers();
    Future<GetBranchDetailSharedEntity> getBranchDetails({required GetBranchDetailsSharedParams getBranchDetailsSharedParams});
  Future<BaseEntity> forgetPassword(ForgetPasswordSharedParams forgetPasswordSharedParams);

}


@Singleton(as: SharedBaseWebServices)
class SharedWebServiceImpl implements SharedBaseWebServices {
  final ApiConsumer _apiConsumer;
  RoleEntity? _cachedRole;

  SharedWebServiceImpl({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;

  @override
  Future<RoleEntity> getRole() async {
    if (_cachedRole != null) {
      return _cachedRole!;
    }
    final response = await _apiConsumer.get(EndPoints.getRoleP);
    debugPrint(" --------------- Making the Api Call From Shared ---------------");
    _cachedRole = RoleEntity.fromJson(response);
    return _cachedRole!;
  }

  RoleEnum _mapRoleStringToEnum(String role) {
    String normalizedRole = role.replaceAll('_', '').toLowerCase();
    return RoleEnum.values.firstWhere(
      (roleEnum) => roleEnum.toString().split('.').last.toLowerCase() == normalizedRole,
      orElse: () => throw Exception('Role not found'),
    );
  }


  @override
Future<String> getRoleSpecificEndpoint(String endpointKey) async {
  // Check if the endpointKey is valid
  if (endpointKey.isEmpty) {
    throw Exception('Invalid endpoint key');
  }

  // Check if the role is already cached
  if (_cachedRole == null) {
    _cachedRole = await getRole();
  }

  // Map the role string to the enum
  RoleEnum roleEnum = _mapRoleStringToEnum(_cachedRole!.role);

  // Get the endpoint map for the current role
  final roleMap = EndPoints.roleEndpoints[roleEnum];
  if (roleMap != null && roleMap.containsKey(endpointKey)) {
    return roleMap[endpointKey]!;
  } else {
    throw Exception('Endpoint not found for the given role and key');
  }
}


  @override
  Future<BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity>>> getAllGoodPaginated(int page) async {
    String endpoint = await getRoleSpecificEndpoint('getAllGoodsPaginated');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: {"page": page}),
      (json) => GetAllGoodPaginatedEntity.fromJson(json),
    );
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
  Future<BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedSharedEntity>>> getAllActiveTrips(PaginatedParams paginatedParams) async{
   String endpoint = await getRoleSpecificEndpoint('getAllActiveTripsPaginated');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: paginatedParams.toJson()),
      (json) => ActiveTripsPaginatedSharedEntity.fromJson(json),
    );
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedSharedEntity>>> getAllBranches(PaginatedParams paginatedParams) async{
 String endpoint = await getRoleSpecificEndpoint('getAllBranchesPaginated');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: paginatedParams.toJson()),
      (json) => GetAllBranchesPaginatedSharedEntity.fromJson(json),
    );
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<ClosedTripsPaginatedSharedEntity>>> getAllClosedTrips(PaginatedParams paginatedParams) async{
 String endpoint = await getRoleSpecificEndpoint('getClosedTripsPaginated');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: paginatedParams.toJson()),
      (json) => ClosedTripsPaginatedSharedEntity.fromJson(json),
    );
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<TypePaginatedSharedEntity>>> shippingPriceList(PaginatedParams paginatedParams) async{
 String endpoint = await getRoleSpecificEndpoint('getTypePriceListPaginated');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: paginatedParams.toJson()),
      (json) => TypePaginatedSharedEntity.fromJson(json),
    );
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedSharedEntity>>> getAllArchiveTrips(PaginatedParams paginatedParams) async{
 String endpoint = await getRoleSpecificEndpoint('getAllArchiveTrips');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: paginatedParams.toJson()),
      (json) => ArchiveTripsPaginatedSharedEntity.fromJson(json),
    );
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<TruckRecordPaginatedSharedEntity>>> getAllTruckRecordPaginated(PaginatedParams paginatedParams) async{
 String endpoint = await getRoleSpecificEndpoint('getAllTrucksPaginated');
    debugPrint(" --------------- Making the Api Call From Shared ---------------");

    return await _getResultWithPagination(
      () => _apiConsumer.get(endpoint, queryParameters: paginatedParams.toJson()),
      (json) => TruckRecordPaginatedSharedEntity.fromJson(json),
    );
  }
  
  @override
  Future<GetManifestSharedEntity> getManifest(ManifestSharedParams manifestSharedParams) async {
    String endpoint = await getRoleSpecificEndpoint('getManifest');
    debugPrint("--------------- Making the Api Call From Shared ---------------");
    final response = await _apiConsumer.get("$endpoint/${manifestSharedParams.manifestNumber}");
    return GetManifestSharedEntity.fromJson(response);
  }
  
  @override
  Future<GetTripInformationSharedEntity> getTripInformation(TripInformationSharedParams tripInformationSharedParams) async{
    String endpoint = await getRoleSpecificEndpoint('getTripInformation');
    debugPrint("--------------- Making the Api Call From Shared ---------------");
    final response = await _apiConsumer.get("$endpoint/${tripInformationSharedParams.tripNumber}");
    return GetTripInformationSharedEntity.fromJson(response);
  }
  
  @override
  Future<GetTruckInformationSharedEntity> getTruckInformation(TruckInformationSharedParams truckInformationSharedParams) async{
    String endpoint = await getRoleSpecificEndpoint('truckInformation');
    debugPrint("--------------- Making the Api Call From Shared ---------------");
    final response = await _apiConsumer.get("$endpoint/${truckInformationSharedParams.truckNumber}");
    return GetTruckInformationSharedEntity.fromJson(response);
  }
  
  @override
  Future<BaseDriverSharedEntity> getAllDrivers() async{
    String endpoint = await getRoleSpecificEndpoint('getAllDrivers');
    debugPrint("--------------- Making the Api Call From Shared ---------------");
    final response = await _apiConsumer.get(endpoint);
    return BaseDriverSharedEntity.fromJson(response);
  }
  
  @override
  Future<GetBranchDetailSharedEntity> getBranchDetails({required GetBranchDetailsSharedParams getBranchDetailsSharedParams}) async{
    String endpoint = await getRoleSpecificEndpoint('getBranchById');
    debugPrint("--------------- Making the Api Call From Shared ---------------");
    final response = await _apiConsumer.get("$endpoint/${getBranchDetailsSharedParams.branchId}");
    return GetBranchDetailSharedEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> forgetPassword(ForgetPasswordSharedParams forgetPasswordSharedParams) async{
    debugPrint("--------------- Making the Api Call From Shared ---------------");
    final response = await _apiConsumer.post(EndPoints.forgetPassword,body: forgetPasswordSharedParams.toJson());
    return BaseEntity.fromJson(response);
  }
}
