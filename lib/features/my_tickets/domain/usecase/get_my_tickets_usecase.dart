import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/entity/ticket_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/repository/my_tickets_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/async_usecase_template.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';

@injectable
class GetMyTicketsUsecase
    implements AsyncUsecase<String, List<TicketEntity>, NoParams> {
  final MyTicketsRepository repository;

  GetMyTicketsUsecase(this.repository);

  @override
  Future<Either<String, List<TicketEntity>>> call(NoParams p) {
    return repository.getMyTickets();
  }
}
