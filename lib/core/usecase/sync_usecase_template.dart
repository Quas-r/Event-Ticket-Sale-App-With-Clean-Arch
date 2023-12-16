
import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';

abstract class SyncUsecase<L,R,P> extends Usecase<L,R,P> {

  Either<L,R> call(P p);

}