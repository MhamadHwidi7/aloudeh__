class AddInvoiceParams {
  final int sourceId;
  final int destinationId;
  final String manifestNumber;
  final String sender;
  final String receiver;
  final String senderNumber;
  final String receiverNumber;
  final String numOfPackages;
  final String typeId;
  final String weight;
  final String size;
  final String content;
  final String marks;
  final double? shippingCost;
  final double? againstShipping;
  final double? adapter;
  final double? advance;
  final double? miscellaneous;
  final double? prepaid;
  final double? discount;
  final double? collection;
  final String? quantity;

  AddInvoiceParams({
    required this.sourceId,
    required this.destinationId,
    required this.manifestNumber,
    required this.sender,
    required this.receiver,
    required this.senderNumber,
    required this.receiverNumber,
    required this.numOfPackages,
    required this.typeId,
    required this.weight,
    required this.size,
    required this.content,
    required this.marks,
    this.shippingCost,
    this.againstShipping,
    this.adapter,
    this.advance,
    this.miscellaneous,
    this.prepaid,
    this.discount,
    this.collection,
    this.quantity,
  });

  Map<String, dynamic> toJson() => {
        "source_id": sourceId,
        "destination_id": destinationId,
        "manifest_number": manifestNumber,
        "sender": sender,
        "receiver": receiver,
        "sender_number": senderNumber,
        "receiver_number": receiverNumber,
        "num_of_packages": numOfPackages,
        "type_id": typeId,
        "weight": weight,
        "size": size,
        "content": content,
        "marks": marks,
        "shipping_cost": shippingCost,
        "against_shipping": againstShipping,
        "adapter": adapter,
        "advance": advance,
        "miscellaneous": miscellaneous,
        "prepaid": prepaid,
        "discount": discount,
        "collection": collection,
                "quantity": quantity,

      };
}
