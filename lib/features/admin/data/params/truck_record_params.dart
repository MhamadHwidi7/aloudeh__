class TruckRecordParams {
  final String desk;

  TruckRecordParams({required this.desk});

  Map<String, dynamic> toJson() => {
        "desk": desk,
      };
}
