class EndPoints {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
    static const String adminRegister = '$baseUrl/register';
        static const String adminLogIn = '$baseUrl/login';

    static const String addbranch = '$baseUrl/admin/addbranch';
    static const String addWarehouse = '$baseUrl/admin/addwarehouse';
    static const String addWarehouseManager = '$baseUrl/admin/addwarehousemanager';
    static const String updateBranch = '$baseUrl/admin/updatebranch';
    static const String updateWarehouse = '$baseUrl/admin/UpdateWarehouse';
    static const String deleteBranch = '$baseUrl/admin/deleteBranch';
    static const String deleteWarehouse = '$baseUrl/admin/deleteWarehouse';
    static const String getBranches = '$baseUrl/admin/getbranches';
    static const String truckRecord = '$baseUrl/admin/truckrecord';

}
