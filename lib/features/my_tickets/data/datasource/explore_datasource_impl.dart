import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/data/datasource/my_tickets_datasource.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/data/model/ticket_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MyTicketsDataSource)
class ExploreDataSourceImpl implements MyTicketsDataSource {
  @override
  Future<Either<String, List<TicketModel>>> getMyTickets() {
    // TODO: implement getStoreExample
    throw UnimplementedError();
  }
  
}
