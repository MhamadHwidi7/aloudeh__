
class AddGoodParams {
  final String barcode;
  AddGoodParams( {required this.barcode});

  Map<String, dynamic> toJson() => {"barcode": barcode,};
}
