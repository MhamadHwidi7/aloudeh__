class LogInWarehouseParams {
  final String name;
  final String password;
  final String deviceToken;

  LogInWarehouseParams({required this.name, required this.password, required this.deviceToken});


  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "device_token":deviceToken
      };
}
