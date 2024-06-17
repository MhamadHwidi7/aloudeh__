class DeleteCustomerParams {
  final int customerId;


  DeleteCustomerParams({
    required this.customerId,
  });

  Map<String, dynamic> toJson() =>{

      "customer_id": customerId,
  
  }
;}
