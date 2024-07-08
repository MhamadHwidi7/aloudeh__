import 'package:aloudeh_company/core/enum/role_enum.dart';

class EndPoints {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static const String getRoleP = '$baseUrl/get-role';
  static const String forgetPassword = '$baseUrl/sendresetlink';

  static const Map<RoleEnum, Map<String, String>> roleEndpoints = {
    RoleEnum.admin: {
      'register': '$baseUrl/register',
      'login': '$baseUrl/login',
      'getBranches': '$baseUrl/admin/getbranches',
      'getAllActiveTripsAdmin': '$baseUrl/admin/getallactivetrips',
      'getAllArchiveTrips': '$baseUrl/admin/GetArchiveData',
      'getTripInformationAdmin': '$baseUrl/admin/GetTripInformation',
      'getAllCustomersPaginated': '$baseUrl/admin/getcustomers',
            'getClosedTripsPaginated': '$baseUrl/admin/getallclosedtrips',
      'truckInformation': '$baseUrl/admin/truckinformation',
      'getAllTrucksPaginated': '$baseUrl/admin/gettrucks',
      'getAllDrivers': '$baseUrl/admin/drivers',
      'getBranchById': '$baseUrl/admin/branches',

    },
    RoleEnum.branchManager: {
//!Add the shared apis for branch manager here ..
    },
    RoleEnum.warehouseManager: {
      'getAllGoodsPaginated': '$baseUrl/warehousemanager/getallgoods',

      'getManifestWarehouse': '$baseUrl/warehousemanager/getManifest',
    },
    RoleEnum.employee: {
      'getTripsPaginated': '$baseUrl/employee/gettrips',
      'getAllBranchesPaginated': '$baseUrl/employee/getbranches',
      'getAllActiveTripsPaginated': '$baseUrl/employee/getallactivetrips',
      'getTripInformation': '$baseUrl/employee/GetTripInformation',
      'getAllArchiveTripsPaginated': '$baseUrl/employee/getarchivedata',
      'getTrucksPaginated': '$baseUrl/employee/gettrucks',
      'getTypePriceListPaginated': '$baseUrl/employee/priceslist',
      'getAllCustomersPaginated': '$baseUrl/employee/getcustomers',
      'truckInformation': '$baseUrl/employee/truckinformation',
      'getAllDrivers': '$baseUrl/employee/drivers',
      'getManifest': '$baseUrl/employee/getManifest',
      'truckRecord': '$baseUrl/employee/truckrecord',
      'getBranchById': '$baseUrl/employee/branches',
      'getProfile': '$baseUrl/employee/myprofile',
      'getClosedTripsPaginated': '$baseUrl/employee/getallclosedtrips',
      'getAllTrucksPaginated': '$baseUrl/employee/gettrucks',
      'getAllArchiveTrips': '$baseUrl/employee/GetArchiveData',

      
    },
    RoleEnum.driver: {
      'login': '$baseUrl/login',
      'getMyTrips': '$baseUrl/driver/getmytrips',
      'getProfile': '$baseUrl/driver/getprofile',
    },
    RoleEnum.customer: {
      // Add customer-specific endpoints if any
    },
  };
}
