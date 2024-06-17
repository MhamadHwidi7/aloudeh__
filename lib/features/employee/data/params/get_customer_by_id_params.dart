class GetCustomerByIdParams {
  final String customerId;

  GetCustomerByIdParams({required this.customerId});

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
      };
}
