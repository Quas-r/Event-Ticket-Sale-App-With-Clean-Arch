import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_entity.dart';

class EventModel extends EventEntity {
  @override
  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['eventId'];
    eventName = json['eventName'];
    eventImage = json['eventImage'];
    eventImage2 = json['eventImage2'];
    eventDescription = json['eventDescription'];
    eventLogDate = json['eventLogDate'];
    eventDuration = json['eventDuration'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = id;
    data['eventName'] = eventName;
    data['eventImage'] = eventImage;
    data['eventImage2'] = eventImage2;
    data['eventDescription'] = eventDescription;
    data['eventLogDate'] = eventLogDate;
    data['eventDuration'] = eventDuration;
    return data;
  }
}
