import 'package:event_ticket_sale_app_with_clean_arch/features/events/data/datasource/events_datasource.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/data/model/event_details_model.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/repository/events_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable(as: EventsRepository)
class EventsRepositoryImpl implements EventsRepository {
  EventsDataSource dataSource;
  EventsRepositoryImpl(this.dataSource);

    @override
  Future<Either<String, EventDetailsEntity>> getEventDetails(String id) async {
    var result = await dataSource.getEventDetails(id);
    if (result.isRight()) {
      return Right(result.getOrElse(() => EventDetailsModel.fromJson({})));
    } else {
      String message = "";
      result.fold((l) => message = l, (r) => null);
      return Left(message);
    }
  }
}
