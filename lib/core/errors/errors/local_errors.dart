class CacheException{
  final String message;
  CacheException({this.message = "Cache Exception"});
}

enum CacheExceptions{
  noTokenCached, emptyTokenFound, noUserIdCached, userNotFound
}