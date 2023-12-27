import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/usecase/get_event_details_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'events_logic_holder.g.dart';

@injectable
class EventsLogicHolder = _EventsLogicHolderBase with _$EventsLogicHolder;

abstract class _EventsLogicHolderBase with Store {
  GetEventDetailsUsecase getEventDetailsUsecase;

  _EventsLogicHolderBase(this.getEventDetailsUsecase);

  @observable
  bool isEventDetailsLoading = false;

  EventDetailsEntity? eventDetails;

  Future<EventDetailsEntity?> getEventDetails(String id) async {
    isEventDetailsLoading = true;
    var result = await getEventDetailsUsecase.call(id);
    isEventDetailsLoading = false;
    eventDetails = result?.getOrElse(() => EventDetailsEntity());
    return eventDetails;
  }
}
