import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/async_usecase_template.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/repository/home_repository.dart';

@injectable
class GetEventsUsecase
    implements AsyncUsecase<String, List<EventEntity>, NoParams> {
  final HomeRepository repository;

  GetEventsUsecase(this.repository);

  @override
  Future<Either<String, List<EventEntity>>>? call(NoParams p) {
    return repository.getEvents();
  }
}
