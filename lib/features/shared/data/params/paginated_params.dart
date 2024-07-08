class PaginatedParams{
  final int page;

  PaginatedParams({required this.page});

   Map<String,dynamic>toJson()=>{
    "page":page
   };
}