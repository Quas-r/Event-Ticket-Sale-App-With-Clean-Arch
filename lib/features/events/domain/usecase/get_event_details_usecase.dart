import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/repository/events_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/async_usecase_template.dart';

@injectable
class GetEventDetailsUsecase
    implements AsyncUsecase<String, EventDetailsEntity, String> {
  final EventsRepository repository;

  GetEventDetailsUsecase(this.repository);

  @override
  Future<Either<String, EventDetailsEntity>>? call(String id) {
    return repository.getEventDetails(id);
  }
}
