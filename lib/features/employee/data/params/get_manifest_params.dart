class GetManifestParams {
  final String manifestNumber;

  GetManifestParams({
    required this.manifestNumber,
  });

  Map<String, dynamic> toJson() => {
        'manifest_number': manifestNumber,
      };
}
