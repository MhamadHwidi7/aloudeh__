class GetTruckRecordParams {
  final String desk;

  GetTruckRecordParams({
    required this.desk,
  });

  Map<String, dynamic> toJson() => {
        'desk': desk,
      };
}
