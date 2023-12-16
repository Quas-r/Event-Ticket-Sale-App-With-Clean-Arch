class TicketEntity {
  String? exampleField;

  TicketEntity({
    this.exampleField
  });

  TicketEntity.fromJson(Map<String, dynamic> json) {
    exampleField = json['exampleField'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exampleField'] = exampleField;
    return data;
  }
}
