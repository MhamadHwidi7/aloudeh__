class ReceivingGoodParams {
  final String barcode;

  ReceivingGoodParams({required this.barcode});

  Map<String, dynamic> toJson() => {"barcode": barcode};
}
