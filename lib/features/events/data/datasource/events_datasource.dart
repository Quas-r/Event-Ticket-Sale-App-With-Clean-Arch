import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/data/model/event_details_model.dart';

abstract class EventsDataSource {
  Future<Either<String, EventDetailsModel>> getEventDetails(String id);
}
