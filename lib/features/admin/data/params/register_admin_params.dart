class RegisterAdminParams {
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final String password;

  RegisterAdminParams(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.password});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "password": password,
      };
}
