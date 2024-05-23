class EndPoints {
  static const String baseUrl = 'http:// 192.168.1.4:8000/api';
  static const String adminRegister = '$baseUrl/register';
  static const String adminLogIn = '$baseUrl/login';

  static const String addbranch = '$baseUrl/admin/addbranch';
  static const String addWarehouse = '$baseUrl/admin/addwarehouse';
  static const String addWarehouseManager =
      '$baseUrl/admin/addwarehousemanager';
  static const String updateBranch = '$baseUrl/admin/updatebranch';
  static const String updateWarehouse = '$baseUrl/admin/UpdateWarehouse';
  static const String deleteBranch = '$baseUrl/admin/deleteBranch';
  static const String deleteWarehouse = '$baseUrl/admin/deleteWarehouse';
  static const String getBranches = '$baseUrl/admin/getbranches';
  static const String truckRecord = '$baseUrl/admin/truckrecord';

  static const String addEmployee = '$baseUrl/branchmanager/addemployee';
  static const String branchManagerLogin = '$baseUrl/login';
  static const String updateEmployee = '$baseUrl/branchmanager/updateemployee';
  static const String updateDriver = '$baseUrl/branchmanager/updatedriver';
  static const String deleteEmployee = '$baseUrl/branchmanager/deleteemployee';
  static const String addTruck = '$baseUrl/branchmanager/addtruck';
  static const String updateTruck = '$baseUrl/branchmanager/updatetruck';
  static const String deleteTruck = '$baseUrl/branchmanager/deletetruck';
  static const String deleteDriver = '$baseUrl/branchmanager/deletedriver';
  static const String promoteEmployee =
      '$baseUrl/branchmanager/promoteemployee';
  static const String rateEmployee = '$baseUrl/branchmanager/rateemployee';
  static const String truckInformation =
      '$baseUrl/branchmanager/truckinformation';
  static const String branchManagerTruckRecord =
      '$baseUrl/branchmanager/truckrecord';
  static const String getEmployee = '$baseUrl/branchmanager/getemployees';
  static const String brunchManagerGetBranches =
      '$baseUrl/branchmanager/getbranches';
  static const String addVacationForEmployee =
      '$baseUrl/branchmanager/addvacationforemployee';
  static const String addVacationForWarehouse =
      '$baseUrl/branchmanager/addvacationforwmanager';
  static const String getEmployeeVacations =
      '$baseUrl/branchmanager/getemployeevacation';
  static const String getWarehouseManagerVacations =
      '$baseUrl/branchmanager/getwmanagervacation';
  static const String editPermissions =
      '$baseUrl/branchmanager/getwmanagervacation';
  static const String getCustomers = '$baseUrl/branchmanager/getcustomers';
  static const String addShippingCosts =
      '$baseUrl/branchmanager/shippingprices';
  static const String editShippingCosts =
      '$baseUrl/branchmanager/editshippingprices';
  static const String getPricesList = '$baseUrl/branchmanager/priceslist';
}
