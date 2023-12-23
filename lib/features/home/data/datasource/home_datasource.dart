import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/data/model/event_dates_model.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/data/model/event_model.dart';

abstract class HomeDataSource {
  Future<Either<String, List<EventModel>>> getEvents();
  Future<Either<String, EventDatesModel>> getEventDates(String id);
}
