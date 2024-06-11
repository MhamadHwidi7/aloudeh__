class UpdateManifestParams {
  final String manifestId;
  final String? status;
  final String? discount;
  final String? miscPaid;
  final String? againstShipping;
  final String? adapter;
  final String? advance;
  final String? collection;

  UpdateManifestParams({
    required this.manifestId,
    this.status,
    this.discount,
    this.miscPaid,
    this.againstShipping,
    this.adapter,
    this.advance,
    this.collection,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'manifest_id': manifestId,
    };
    if (status != null) data['status'] = status;
    if (discount != null) data['discount'] = discount;
    if (miscPaid != null) data['misc_paid'] = miscPaid;
    if (againstShipping != null) data['against_shipping'] = againstShipping;
    if (adapter != null) data['adapter'] = adapter;
    if (advance != null) data['advance'] = advance;
    if (collection != null) data['collection'] = collection;
    return data;
  }
}
