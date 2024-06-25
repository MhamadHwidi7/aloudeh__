class InventoryGoodsParams {
  final List<String> barcodes;

  InventoryGoodsParams({required this.barcodes});

  Map<String, dynamic> toJson() => {
    "barcodes": barcodes,
  };
}