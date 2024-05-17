class LogInAdminParams {
  final String name;
  final String password;

  LogInAdminParams({required this.name, required this.password});

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
      };
}
