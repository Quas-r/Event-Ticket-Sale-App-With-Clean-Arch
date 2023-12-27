import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';

abstract class EventsRepository {
  Future<Either<String, EventDetailsEntity>> getEventDetails(String id);
}
