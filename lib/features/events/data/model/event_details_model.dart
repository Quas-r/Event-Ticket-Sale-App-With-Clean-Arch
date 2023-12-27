import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';

class EventDetailsModel extends EventDetailsEntity{

  @override
  EventDetailsModel.fromJson(Map<String, dynamic> json) {
    final key = json.keys.first;
    eventImage = json[key][0]['eventImage'];
    eventName = json[key][0]['eventName'];
    if (json[key] != null) {
      eventSubDetailsEntity = <EventDetailsSubEntity>[];
      json[key].forEach((item) {
        item['eventSubDetails'].forEach((v) {
          eventSubDetailsEntity?.add(EventDetailsSubEntity.fromJson(v));
        });
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventImage'] = eventImage;
    data['eventName'] = eventName;
    if (eventSubDetailsEntity != null) {
      data['eventSubDetails'] = eventSubDetailsEntity?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventDetailsSubModel extends EventDetailsSubEntity{

  @override
  EventDetailsSubModel.fromJson(Map<String, dynamic> json) {
    eventParticularId = json['eventParticularId'];
    eventDate = json['eventDate'];
    eventTime = json['evenTime'];
    eventLocation = json['eventLocation'];
    eventPrice = json['eventPrice'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventParticularId'] = eventParticularId;
    data['eventDate'] = eventDate;
    data['evenTime'] = eventTime;
    data['eventLocation'] = eventLocation;
    data['eventPrice'] = eventPrice;
    return data;
  }
}
