class EventDatesEntity {
  String? eventImage;
  List<EventDetailEntity>? eventDetails;

  EventDatesEntity({this.eventImage, this.eventDetails});

  EventDatesEntity.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventImage'] = eventImage;
    if (eventDetails != null) {
      data['eventDetails'] = eventDetails?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventDetailEntity {
  String? eventParticularId;
  String? eventDate;

  EventDetailEntity({this.eventParticularId, this.eventDate});

  EventDetailEntity.fromJson(Map<String, dynamic> json) {
    eventParticularId = json['eventParticularId'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventParticularId'] = eventParticularId;
    data['eventDate'] = eventDate;
    return data;
  }
}
