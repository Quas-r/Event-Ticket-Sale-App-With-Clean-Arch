import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';


class EventDatesModel extends EventDatesEntity{

  @override
  EventDatesModel.fromJson(Map<String, dynamic> json) {
    final key = json.keys.first;
    eventImage = json[key][0]['eventImage'];
    if (json[key] != null) {
      eventDetails = <EventDetailEntity>[];
      json[key].forEach((item) {
        item['eventDetails'].forEach((v) {
          eventDetails?.add(EventDetailEntity.fromJson(v));
        });
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventImage'] = eventImage;
    if (eventDetails != null) {
      data['eventDetails'] = eventDetails?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventDetailModel extends EventDetailEntity{

  @override
  EventDetailModel.fromJson(Map<String, dynamic> json) {
    eventParticularId = json['eventParticularId'];
    eventDate = json['eventDate'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventParticularId'] = eventParticularId;
    data['eventDate'] = eventDate;
    return data;
  }
}
