import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/customer_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/destination_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_customers_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_drivers_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_receipts_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_branch_by_id_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_record_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/report_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/tracking_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/add_compliant_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_invoice_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/archive_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/cancel_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/delete_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/edit_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_all_receipt_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_branch_by_id_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_customer_by_id_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_manifest_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_trip_information.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_information_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_record_params.dart';
import 'package:aloudeh_company/features/employee/data/params/tracking_params.dart';
import 'package:aloudeh_company/features/employee/data/params/trip_archive_params.dart';
import 'package:aloudeh_company/features/employee/data/params/update_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/update_manifest_params.dart';
import 'package:injectable/injectable.dart';

abstract class EmployeeBaseWebServices {
  Future<BaseEntity> addTrip(AddTripParams addTripParams);
  Future<BaseEntity> addInvoice(AddInvoiceParams addInvoiceParams);
  Future<BaseEntity> editTrip(EditTripParams editTripParams);
  Future<BaseEntity> cancelTrip(CancelTripParams cancelTripParams);
  Future<BaseEntity> tripArchive(TripArchiveParams tripArchiveParams);
  Future<BasePaginationEntity<PaginationEntity<GetAllTripsPaginatedEntity>>>
      getAllTripsPaginated();
  Future<BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedEntity>>>
      getAllBranches(int page);
  Future<BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedEntity>>>
      getAllActiveTrips(int page);
  Future<GetTripInformationEntity> getTripInfo(
      GetTripInformationParams getTripInformationParams);
  Future<BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedEntity>>>
      getAllArchiveTrips(int page);
  Future<BasePaginationEntity<PaginationEntity<TruckRecordPaginatedEntity>>>
      getAllTruckRecordPaginated(int page);
  Future<GetAllReceiptsEntity> getAllReceipt(
      GetAllReceiptParams getAllReceiptParams);
  Future<GetTruckInformationEntity> getTruckInformation(
      GetTruckInformationParams getTruckInformationParams);
  Future<GetManifestEntity> getManifest(GetManifestParams getManifestParams);
  Future<GetTruckRecordEntity> getTruckRecord(
      GetTruckRecordParams getTruckRecordParams);
  Future<BaseEntity> addCustomer(AddCustomerParams addCustomerParams);
  Future<BaseEntity> updateCustomer(UpdateCustomerParams updateCustomerParams);
  Future<BaseEntity> deleteCustomer(DeleteCustomerParams deleteCustomerParams);
  Future<BaseEntity> updateManifest(UpdateManifestParams updateManifestParams);
  Future<BaseEntity> addCompliant(AddCompliantParams addCompliantParams);
  Future<BaseReportEntity> getTripReport();
  Future<BaseReportEntity> getTruckReport();
  Future<GetBranchLocationEntity> getBranchLocation(
      {required GetBranchLocationParams getBranchLocationParams});
  Future<BaseTrackingEntity> getDriverTracking(
      {required TrackingParams trackingParams});
  Future<
          BasePaginationEntity<
              PaginationEntity<GetCustomerEmployeePaginatedEntity>>>
      getAllCustomers(int page);
  Future<CustomerEmployeeEntity> getCustomerById(
      GetCustomerByIdParams getCustomerByIdParams);
  Future<BaseDriverEntity> getAllDrivers();
  Future<BaseDestinationEntity> getAllDestination();
  Future<BaseEntity> archiveTrip(ArchiveTripParams archiveTripParams);
  Future<GetBranchByIdEntity> getBranchById(
      GetBranchByIdParams getBranchByIdParams);
}

@Singleton(as: EmployeeBaseWebServices)
class EmployeeWebServicesImpl implements EmployeeBaseWebServices {
  final ApiConsumer _apiConsumer;

  EmployeeWebServicesImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<BaseEntity> addTrip(AddTripParams addTripParams) async {
    final response = await _apiConsumer.post(EndPoints.addTripEmployee,
        body: addTripParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> addInvoice(AddInvoiceParams addInvoiceParams) async {
    final response = await _apiConsumer.post(EndPoints.addInvoiceEmployee,
        body: addInvoiceParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> cancelTrip(CancelTripParams cancelTripParams) async {
    final response = await _apiConsumer.post(EndPoints.cancelTripEmployee,
        body: cancelTripParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> editTrip(EditTripParams editTripParams) async {
    final response = await _apiConsumer.post(EndPoints.editTripEmployee,
        body: editTripParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> tripArchive(TripArchiveParams tripArchiveParams) async {
    final response = await _apiConsumer.post(EndPoints.tripArchiveEmployee,
        body: tripArchiveParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BasePaginationEntity<PaginationEntity<GetAllTripsPaginatedEntity>>>
      getAllTripsPaginated() async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(
              EndPoints.getTripsPaginatedEmployee,
            ),
        (json) => GetAllTripsPaginatedEntity.fromJson(json));
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
  Future<BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedEntity>>>
      getAllBranches(int page) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getAllBranchesPaginatedEmployee,
            queryParameters: {"page": page}),
        (json) => GetAllBranchesPaginatedEntity.fromJson(json));
  }

  @override
  Future<BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedEntity>>>
      getAllActiveTrips(int page) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getAllActiveTripsPaginatedEmployee,
            queryParameters: {"page": page}),
        (json) => ActiveTripsPaginatedEntity.fromJson(json));
  }

  @override
  Future<GetTripInformationEntity> getTripInfo(
      GetTripInformationParams getTripInformationParams) async {
    final response = await _apiConsumer.get(
        "${EndPoints.getTripInformationEmployee}/${getTripInformationParams.tripNumber}");
    return GetTripInformationEntity.fromJson(response);
  }

  @override
  Future<BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedEntity>>>
      getAllArchiveTrips(int page) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getAllArchiveTripsPaginatedEmployee,
            queryParameters: {"page": page}),
        (json) => ArchiveTripsPaginatedEntity.fromJson(json));
  }

  @override
  Future<BasePaginationEntity<PaginationEntity<TruckRecordPaginatedEntity>>>
      getAllTruckRecordPaginated(int page) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getTrucksPaginatedEmployee,
            queryParameters: {"page": page}),
        (json) => TruckRecordPaginatedEntity.fromJson(json));
  }

  @override
  Future<GetAllReceiptsEntity> getAllReceipt(
      GetAllReceiptParams getAllReceiptParams) async {
    final response = await _apiConsumer.get(
        "${EndPoints.getAllReceiptsEmployee}/${getAllReceiptParams.branchId}");
    return GetAllReceiptsEntity.fromJson(response);
  }

  @override
  Future<GetManifestEntity> getManifest(
      GetManifestParams getManifestParams) async {
    final response = await _apiConsumer.get(
        "${EndPoints.getManifestEmployee}/${getManifestParams.manifestNumber}");
    return GetManifestEntity.fromJson(response);
  }

  @override
  Future<GetTruckInformationEntity> getTruckInformation(
      GetTruckInformationParams getTruckInformationParams) async {
    final response = await _apiConsumer.get(
        "${EndPoints.truckInformationEmployee}/${getTruckInformationParams.truckNumber}");
    return GetTruckInformationEntity.fromJson(response);
  }

  @override
  Future<GetTruckRecordEntity> getTruckRecord(
      GetTruckRecordParams getTruckRecordParams) async {
    final response = await _apiConsumer
        .get("${EndPoints.truckRecordEmployee}/${getTruckRecordParams.desk}");
    return GetTruckRecordEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> addCompliant(AddCompliantParams addCompliantParams) async {
    final response = await _apiConsumer.post(EndPoints.addCompliantEmployee,
        body: addCompliantParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> addCustomer(AddCustomerParams addCustomerParams) async {
    final response = await _apiConsumer.post(EndPoints.addCustomerEmployee,
        body: addCustomerParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> deleteCustomer(
      DeleteCustomerParams deleteCustomerParams) async {
    final response = await _apiConsumer.post(EndPoints.deleteCustomerEmployee,
        body: deleteCustomerParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> updateCustomer(
      UpdateCustomerParams updateCustomerParams) async {
    final response = await _apiConsumer.post(EndPoints.updateCustomerEmployee,
        body: updateCustomerParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> updateManifest(
      UpdateManifestParams updateManifestParams) async {
    final response = await _apiConsumer.post(EndPoints.updateManifestEmployee,
        body: updateManifestParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseReportEntity> getTripReport() async {
    final response = await _apiConsumer.get(EndPoints.tripsReportsEmployee);
    return BaseReportEntity.fromJson(response);
  }

  @override
  Future<BaseReportEntity> getTruckReport() async {
    final response = await _apiConsumer.get(EndPoints.truckReportEmployee);
    return BaseReportEntity.fromJson(response);
  }

  @override
  Future<GetBranchLocationEntity> getBranchLocation(
      {required GetBranchLocationParams getBranchLocationParams}) async {
    final response = await _apiConsumer.get(
        "${EndPoints.getBranchLatLngEmployee}/${getBranchLocationParams.branchId}");
    return GetBranchLocationEntity.fromJson(response);
  }

  @override
  Future<BaseTrackingEntity> getDriverTracking(
      {required TrackingParams trackingParams}) async {
    final response = await _apiConsumer.post(
        EndPoints.getDriverTrackingEmployee,
        body: trackingParams.toJson());
    return BaseTrackingEntity.fromJson(response);
  }

  @override
  Future<
          BasePaginationEntity<
              PaginationEntity<GetCustomerEmployeePaginatedEntity>>>
      getAllCustomers(int page) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getAllCustomersPaginatedEmployee,
            queryParameters: {"page": page}),
        (json) => GetCustomerEmployeePaginatedEntity.fromJson(json));
  }

  @override
  Future<CustomerEmployeeEntity> getCustomerById(
      GetCustomerByIdParams getCustomerByIdParams) async {
    final response = await _apiConsumer.post(EndPoints.getCustomerByIdEmployee,
        body: getCustomerByIdParams.toJson());
    return CustomerEmployeeEntity.fromJson(response);
  }

  @override
  Future<BaseDestinationEntity> getAllDestination() async {
    final response =
        await _apiConsumer.get(EndPoints.getAllDestinationsEmployee);
    return BaseDestinationEntity.fromJson(response);
  }

  @override
  Future<BaseDriverEntity> getAllDrivers() async {
    final response = await _apiConsumer.get(EndPoints.getAllDriversEmployee);
    return BaseDriverEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> archiveTrip(ArchiveTripParams archiveTripParams) async {
    final response = await _apiConsumer.post(EndPoints.archiveTripEmployee,
        body: archiveTripParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<GetBranchByIdEntity> getBranchById(
      GetBranchByIdParams getBranchByIdParams) async {
    final response = await _apiConsumer.get(
        "${EndPoints.getBranchByIdEmployee}/${getBranchByIdParams.branchId}");
    return GetBranchByIdEntity.fromJson(response);
  }
}
