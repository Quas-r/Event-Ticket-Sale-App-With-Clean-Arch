import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/entity/ticket_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/domain/usecase/get_my_tickets_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';
import 'package:mobx/mobx.dart';
part 'my_tickets_logic_holder.g.dart';

@injectable
class MyTicketsLogicHolder = _MyTicketsLogicHolderBase with _$MyTicketsLogicHolder;

abstract class _MyTicketsLogicHolderBase with Store {
  GetMyTicketsUsecase getMyTicketsUsecase;
  
  _MyTicketsLogicHolderBase(
    this.getMyTicketsUsecase,
  );

  @observable
  bool isMyTicketsLoading = false;
  
  List<TicketEntity> myTicketsEntities = [];
  
  DateTime? filteredFirstDate;

  Future<List<TicketEntity>> getExamples() async {
    isMyTicketsLoading = true;
    var result = await getMyTicketsUsecase.call(NoParams());
    if (result.isRight()) {
      myTicketsEntities = result.getOrElse(() => []);
    }
    isMyTicketsLoading = false;
    return myTicketsEntities;
  }
}
