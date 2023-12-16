
import '../failure.dart';

class CacheFailures extends Failure{

  const CacheFailures(super.message);

}

enum CacheFailuresTypes {
  noToken, emptyToken
}