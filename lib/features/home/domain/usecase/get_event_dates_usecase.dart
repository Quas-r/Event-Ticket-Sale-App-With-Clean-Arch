import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/async_usecase_template.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/repository/home_repository.dart';

@injectable
class GetEventDatesUsecase
    implements AsyncUsecase<String, EventDatesEntity, String> {
  final HomeRepository repository;

  GetEventDatesUsecase(this.repository);

  @override
  Future<Either<String, EventDatesEntity>> call(String id) {
    return repository.getEventDates(id);
  }
}
