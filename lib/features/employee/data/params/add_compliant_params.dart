class AddCompliantParams {
  final String message;

  AddCompliantParams({required this.message});


  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
