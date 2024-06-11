class GetCustomerByIdParams{
  final int customerId;

  GetCustomerByIdParams({required this.customerId});
    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
      };
}