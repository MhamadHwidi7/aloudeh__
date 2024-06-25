class DeleteGoodParams {
  final String barcode;

  DeleteGoodParams({required this.barcode});

  Map<String, dynamic> toJson() => {"barcode": barcode};
}
