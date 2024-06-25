class GetCustomerFilterParams {
  final String name;

  GetCustomerFilterParams({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
