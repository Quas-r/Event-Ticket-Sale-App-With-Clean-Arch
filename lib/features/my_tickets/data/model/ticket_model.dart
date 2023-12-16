import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/entity/ticket_entity.dart';

class TicketModel extends TicketEntity {
  TicketModel.fromJson(Map<String, dynamic> json) {
    exampleField = json['exampleField'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exampleField'] = exampleField;
    return data;
  }
}
