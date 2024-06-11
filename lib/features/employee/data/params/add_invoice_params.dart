class AddInvoiceParams {
  final String sourceId;
  final String destinationId;
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

  AddInvoiceParams(
      {required this.sourceId,
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
      required this.marks});

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
      };
}
