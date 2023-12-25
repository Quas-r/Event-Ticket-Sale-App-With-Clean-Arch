
class EventEntity {
  String? id;
  String? eventName;
  String? eventImage;
  String? eventImage2;
  String? eventDescription;
  String? eventLogDate;
  double? eventDuration;

  EventEntity({
    this.id,
    this.eventName,
    this.eventImage,
    this.eventImage2,
    this.eventDescription,
    this.eventLogDate,
    this.eventDuration,
  });

  EventEntity.fromJson(Map<String, dynamic> json) {
    id = json['eventId'];
    eventName = json['eventName'];
    eventImage = json['eventImage'];
    eventImage2 = json['eventImage2'];
    eventDescription = json['eventDescription'];
    eventLogDate = json['eventLogDate'];
    eventDuration = json['eventDuration'];
  }

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
