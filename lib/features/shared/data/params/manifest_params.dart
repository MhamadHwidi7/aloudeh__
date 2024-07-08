class ManifestSharedParams {
  final String manifestNumber;

  ManifestSharedParams({
    required this.manifestNumber,
  });

  Map<String, dynamic> toJson() => {
        'manifest_number': manifestNumber,
      };
}
