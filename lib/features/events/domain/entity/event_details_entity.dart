class EventDetailsEntity {
  String? eventImage;
  String? eventName;
  List<EventDetailsSubEntity>? eventSubDetailsEntity;

  EventDetailsEntity({this.eventImage, this.eventName,this.eventSubDetailsEntity});

  EventDetailsEntity.fromJson(Map<String, dynamic> json) {
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

class EventDetailsSubEntity {
  String? eventParticularId;
  String? eventDate;
  String? eventTime;
  String? eventLocation;
  String? eventPrice;

  EventDetailsSubEntity({this.eventParticularId, this.eventDate, this.eventTime, this.eventLocation, this.eventPrice});

  EventDetailsSubEntity.fromJson(Map<String, dynamic> json) {
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
