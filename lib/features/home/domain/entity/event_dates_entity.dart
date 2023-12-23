
class EventDatesEntity {
  String? id;
  String? eventImage;
  String? id2;
  String? eventDate;


  EventDatesEntity({
    this.id,
    this.eventImage,
    this.id2,
    this.eventDate
  });

  EventDatesEntity.fromJson(Map<String, dynamic> json) {
    id = json['eventId'];
    eventImage = json['eventImage'];
    id2 = json['eventId2'];
    eventDate = json['eventDate'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = id;
    data['eventImage'] = eventImage;
    data['eventId2'] = id2;
    data['eventDate'] = eventDate;
    return data;
  }
}


