class EndPoints {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String adminRegister = '$baseUrl/register';
  static const String adminLogIn = '$baseUrl/login';

  static const String addbranch = '$baseUrl/admin/addbranch';
  static const String addBranchManager = '$baseUrl/admin/addbranchmanager';
  static const String addWarehouse = '$baseUrl/admin/addwarehouse';
  static const String addWarehouseManager =
      '$baseUrl/admin/addwarehousemanager';
  static const String updateBranch = '$baseUrl/admin/updatebranch';
  static const String updateWarehouse = '$baseUrl/admin/UpdateWarehouse';
  static const String deleteBranch = '$baseUrl/admin/deleteBranch';
  static const String deleteWarehouse = '$baseUrl/admin/deleteWarehouse';
  static const String getBranches = '$baseUrl/admin/getbranches';
  static const String truckRecord = '$baseUrl/admin/truckrecord';
  static const String truckInformation = '$baseUrl/admin/truckinformation';
  static const String promoteEmpolyee = '$baseUrl/admin/promoteemployee';
  static const String getAllBranchesAdmin = '$baseUrl/admin/getbranches';
  static const String getEmployeeById = '$baseUrl/admin/getemployee';
  static const String getBranchEmployeeById =
      '$baseUrl/admin/getbranchemployees';
  static const String getWarehouseManagerById =
      '$baseUrl/admin/getwarehousemanager';
  static const String getWarehousesPaginated = '$baseUrl/admin/getwarehouses';
  static const String promoteEmployee = '$baseUrl/admin/promoteemployee';
  static const String truckInformationAdmin = '$baseUrl/admin/truckinformation';
  static const String getEmployeeVacation =
      '$baseUrl/admin/getemployeevacation';
  static const String getWmanagerVacation =
      '$baseUrl/admin/getwmanagervacation';
  static const String getAllTripsAdmin = '$baseUrl/admin/gettrips';
  static const String getAllEmployeesAdmin = '$baseUrl/admin/getemployees';
    static const String getAllActiveTripsAdmin = '$baseUrl/admin/getallactivetrips';
    static const String getAllArchiveTripsAdmin = '$baseUrl/admin/GetArchiveData';
    static const String getTripInformationAdmin = '$baseUrl/admin/GetTripInformation';
    static const String getCustomerByIdAdmin = '$baseUrl/admin/getcustomer';
    static const String getCustomersPaginatedAdmin = '$baseUrl/admin/getcustomers';

  ////////////////////////////////////////////  ////////////////////////////////////////////

  static const String addBMEmployee = '$baseUrl/branchmanager/addemployee';
  static const String updateBMEmployee =
      '$baseUrl/branchmanager/updateemployee';
  static const String updateBMDriver = '$baseUrl/branchmanager/updatedriver';
  static const String deleteBMEmployee =
      '$baseUrl/branchmanager/deleteemployee';
  static const String addBMTruck = '$baseUrl/branchmanager/addtruck';
  static const String updateBMTruck = '$baseUrl/branchmanager/updatetruck';
  static const String deleteBMTruck = '$baseUrl/branchmanager/deletetruck';
  static const String deleteBMDriver = '$baseUrl/branchmanager/deletedriver';
  static const String promoteBMEmployee =
      '$baseUrl/branchmanager/promoteemployee';
  static const String rateBMEmployee = '$baseUrl/branchmanager/rateemployee';
  static const String truckBMRecord = '$baseUrl/branchmanager/truckrecord';
  static const String addVacationBMEmployee =
      '$baseUrl/branchmanager/addvacationforemployee';
  static const String addVacationBMWarehouse =
      '$baseUrl/branchmanager/addvacationforwmanager';
  static const String addShippingBMCost =
      '$baseUrl/branchmanager/shippingprices';
  static const String editShippingBMCost =
      '$baseUrl/branchmanager/editshippingprices';
  static const String addTripEmployee = '$baseUrl/employee/addtrip';
  static const String addInvoiceEmployee = '$baseUrl/employee/addinvoice';
  static const String editTripEmployee = '$baseUrl/employee/edittrip';
  static const String cancelTripEmployee = '$baseUrl/employee/canceltrip';
  static const String tripArchiveEmployee = '$baseUrl/employee/archiveData';
  static const String getTripsPaginatedEmployee = '$baseUrl/employee/gettrips';
  static const String getAllBranchesPaginatedEmployee =
      '$baseUrl/employee/getbranches';
  static const String getAllActiveTripsPaginatedEmployee =
      '$baseUrl/employee/getallactivetrips';
  static const String getTripInformationEmployee =
      '$baseUrl/employee/GetTripInformation';
  static const String getAllArchiveTripsPaginatedEmployee =
      '$baseUrl/employee/GetArchiveData';
  static const String getTrucksPaginatedEmployee =
      '$baseUrl/employee/gettrucks';
        static const String getTypePriceListPaginatedEmployee =
      '$baseUrl/employee/priceslist';
        static const String getAllCustomersPaginatedEmployee =
      '$baseUrl/employee/getcustomers';
  static const String getAllReceiptsEmployee = '$baseUrl/employee/allreceipts';
  static const String truckInformationEmployee =
      '$baseUrl/employee/truckinformation';
        static const String getAllDriversEmployee =
      '$baseUrl/employee/drivers';
          static const String getAllDestinationsEmployee =
      '$baseUrl/employee/destinations';
  static const String getManifestEmployee = '$baseUrl/employee/getManifest';
  static const String truckRecordEmployee = '$baseUrl/employee/truckrecord';
  static const String addCustomerEmployee = '$baseUrl/employee/addcustomer';
  static const String updateCustomerEmployee =
      '$baseUrl/employee/updatecustomer';
  static const String updateManifestEmployee =
      '$baseUrl/employee/updatemanifest';
  static const String deleteCustomerEmployee =
      '$baseUrl/employee/deletecustomer';
  static const String addCompliantEmployee = '$baseUrl/employee/addcompliant';
  static const String truckReportEmployee =
      '$baseUrl/employee/alltrucksreports';
  static const String tripsReportsEmployee =
      '$baseUrl/employee/alltripsreports';
  static const String getBranchLatLngEmployee =
      '$baseUrl/employee/getbranchlatlng';
  static const String getDriverTrackingEmployee =
      '$baseUrl/employee/get-location';
  static const String getCustomerByIdEmployee =
      '$baseUrl/employee/getcustomer';
        static const String archiveTripEmployee =
      '$baseUrl/employee/archiveData';
              static const String customerByNameFilterEmployee =
      '$baseUrl/employee/customerByName';
  static const String getBranchByIdEmployee = '$baseUrl/employee/branches';
  static const String getProfileEmployee = '$baseUrl/employee/myprofile';
  static const String employeeLogIn = '$baseUrl/login';
 static const String getClosedTripsPaginatedEmployee =
      '$baseUrl/employee/getallclosedtrips';






     //! ///////////////////////////////////!!!!!!!!Driver
        static const String driverLogIn = '$baseUrl/login';
  static const String getMyTripsDriver =
      '$baseUrl/driver/getmytrips';
        static const String getBranchlatlngDriver =
      '$baseUrl/driver/getbranchlatlng';
              static const String getProfileDriver =
      '$baseUrl/driver/getprofile';
      static const String googleMapShortestPathApi =
      'https://maps.googleapis.com/maps/api/directions/json';
      static const String googleMapsApiKey =
      'AIzaSyAT9wA45sR_sIsLAdWUhw-wLGH_othLH7M';
                  static const String updateLocationDriver =
      '$baseUrl/driver/update-location';
  static const String editDriverProfile =
      '$baseUrl/driver/updateprofile';


      //! / /////////////warehouse
        static const String warehouseLogIn = '$baseUrl/login';
  static const String addGoodWarehouse =
      '$baseUrl/warehousemanager/addgood';
        static const String deleteGoodWarehouse =
      '$baseUrl/warehousemanager/deletegood';
      static const String receivingGoodWarehouse =
      '$baseUrl/warehousemanager/receivingood';
            static const String getGoodWarehouse =
      '$baseUrl/warehousemanager/getgood';
              static const String getAllGoodsPaginatedWarehouse =
      '$baseUrl/warehousemanager/getallgoods';
              static const String getArchiveGoodsPaginatedWarehouse =
      '$baseUrl/warehousemanager/archivedgoods';
            static const String inventoryWarehouse =
      '$baseUrl/warehousemanager/inventory';
              static const String getRoleP =
      '$baseUrl/get-role';
             static const String getWHNotification =
      '$baseUrl/warehousemanager/notifications';
           static const String getWHProfile =
      '$baseUrl/warehousemanager/myprofile';
        static const String sendWHTripStatus =
      '$baseUrl/warehousemanager/trip/status';
        static const String getManifestWarehouse = '$baseUrl/warehousemanager/getManifest';

}
