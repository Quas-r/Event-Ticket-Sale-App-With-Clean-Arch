import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/entity/ticket_entity.dart';

abstract class MyTicketsRepository {
  Future<Either<String, List<TicketEntity>>> getMyTickets();
}
