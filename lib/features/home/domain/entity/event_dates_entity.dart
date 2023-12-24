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
  String? eventTime;
  String? eventLocation;
  String? eventPrice;

  EventDetailEntity({this.eventParticularId, this.eventDate, this.eventTime, this.eventLocation, this.eventPrice});

  EventDetailEntity.fromJson(Map<String, dynamic> json) {
    eventParticularId = json['eventParticularId'];
    eventDate = json['eventDate'];
    eventTime = json['eventTime'];
    eventLocation = json['eventLocation'];
    eventPrice = json['eventPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventParticularId'] = eventParticularId;
    data['eventDate'] = eventDate;
    data['eventTime'] = eventTime;
    data['eventLocation'] = eventLocation;
    data['eventPrice'] = eventPrice;
    return data;
  }
}
