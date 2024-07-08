class ForgetPasswordSharedParams {
  final String email;
  final String role;

  ForgetPasswordSharedParams({required this.email, required this.role});


  Map<String, dynamic> toJson() => {
        "email": email,
        "guard":role
      };
}
