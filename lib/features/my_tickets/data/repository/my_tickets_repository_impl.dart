import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/data/datasource/my_tickets_datasource.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/entity/ticket_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/repository/my_tickets_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable(as: MyTicketsRepository)
class MyTicketsRepositoryImpl implements MyTicketsRepository {
  MyTicketsDataSource dataSource;
  MyTicketsRepositoryImpl(this.dataSource);
  @override
  Future<Either<String, List<TicketEntity>>> getMyTickets() async {
    var result = await dataSource.getMyTickets();
    if (result.isRight()) {
      return Right(result.getOrElse(() => []));
    } else {
      String message = "";
      result.fold((l) => message = l, (r) => null);
      return Left(message);
    }
  }
}
