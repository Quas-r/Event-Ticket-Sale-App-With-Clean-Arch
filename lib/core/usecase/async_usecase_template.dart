import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';

abstract class AsyncUsecase<L, R, P> extends Usecase<L, R, P> {
  Future<Either<L, R>> call(P p);
}
