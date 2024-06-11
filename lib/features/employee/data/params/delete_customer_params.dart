class DeleteCustomerParams {
  final String customerId;


  DeleteCustomerParams({
    required this.customerId,
  });

  Map<String, dynamic> toJson() =>{

      "customer_id": customerId,
  
  }
;}
