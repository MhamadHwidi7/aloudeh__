class GetGoodParams {
  final String barcode;

  GetGoodParams({required this.barcode});

  Map<String, dynamic> toJson() => {"barcode": barcode};
}
