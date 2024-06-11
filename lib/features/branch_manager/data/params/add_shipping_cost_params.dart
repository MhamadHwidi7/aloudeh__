class ShippingCostParams {
  final String cost;
  final String type;

  ShippingCostParams({required this.cost, required this.type});

  Map<String, dynamic> toJson() => {
        "type": type,
        "cost": cost,
      };
}
