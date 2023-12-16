
class EventEntity {
  String? id;
  String? eventName;
  String? eventImage;
  String? eventDescription;
  String? eventLogDate;
  double? eventDuration;

  EventEntity({
    this.id,
    this.eventName,
    this.eventImage,
    this.eventDescription,
    this.eventLogDate,
    this.eventDuration,
  });

  EventEntity.fromJson(Map<String, dynamic> json) {
    id = json['eventId'];
    eventName = json['eventName'];
    eventImage = json['eventImage'];
    eventDescription = json['eventDescription'];
    eventLogDate = json['eventLogDate'];
    eventDuration = json['eventDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = id;
    data['eventName'] = eventName;
    data['eventImage'] = eventImage;
    data['eventDescription'] = eventDescription;
    data['eventLogDate'] = eventLogDate;
    data['eventDuration'] = eventDuration;
    return data;
  }
}
