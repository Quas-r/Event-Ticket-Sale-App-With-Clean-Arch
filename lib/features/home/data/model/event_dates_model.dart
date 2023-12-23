import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';


class EventDatesModel extends EventDatesEntity {
  @override
  EventDatesModel.fromJson(Map<String, dynamic> json) {
    id = json['eventId'];
    eventImage = json['eventImage'];
    id2 = json['eventId2'];
    eventDate = json['eventDate'];

  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = id;
    data['eventImage'] = eventImage;
    data['eventId2'] = id2;
    data['eventDate'] = eventDate;
    return data;
  }
}
