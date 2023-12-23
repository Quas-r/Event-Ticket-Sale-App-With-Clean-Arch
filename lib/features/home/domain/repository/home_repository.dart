import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_entity.dart';

abstract class HomeRepository {
  Future<Either<String, List<EventEntity>>> getEvents();
  Future<Either<String, EventDatesEntity>> getEventDates(String id);
}
