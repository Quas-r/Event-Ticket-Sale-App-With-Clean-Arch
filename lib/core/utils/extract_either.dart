import 'package:dartz/dartz.dart';

class ExtractEither {
  getLeft(Either<dynamic, dynamic> either) {
    late dynamic left;
    either.fold((l) => left = l, (r) => null);
    return left;
  }

  getRight(Either<dynamic, dynamic> either) {
    late dynamic right;
    either.fold((l) => null, (r) => right = r);
    return right;
  }
}