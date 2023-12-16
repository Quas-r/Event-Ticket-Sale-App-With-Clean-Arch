import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/data/model/ticket_model.dart';

abstract class MyTicketsDataSource {
  Future<Either<String, List<TicketModel>>> getMyTickets();
}
