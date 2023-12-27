import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/pages/my_tickets_screen.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/home_screen.dart';
import 'package:mobx/mobx.dart';
part 'main_logic_holder.g.dart';

@injectable
class MainLogicHolder = _MainLogicHolderBase with _$MainLogicHolder;

abstract class _MainLogicHolderBase with Store {
  @observable
  int pageIndex = 0;

  List<Widget> bodyPages = [
    HomeScreen(),
    MyTicketsScreen(),
    const ProfileScreen()
  ];
  List<String> appBarTitles = ["Home", "My Tickets", "Profile"];
}
