import 'package:flutter/material.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_appbar.dart'; // Eğer CustomAppBar dosyanızın adı bu değilse düzeltin
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_bottombar.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/logic_holder/main_logic_holder.dart/main_logic_holder.dart';

final MainLogicHolder mainLogicHolder = locator<MainLogicHolder>();

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
          title: mainLogicHolder.appBarTitles[mainLogicHolder.pageIndex],
          showBackButton: false,
          onBackButtonPressed: () {},
          acts: [],
        ).getStandardWidget(),
        bottomNavigationBar: CustomBottomBar(
          mainLogicHolder,
        ).bottomNavigationBar(
          context,
          isMainScreen: true,
        ),
        body: mainLogicHolder.bodyPages[mainLogicHolder.pageIndex],
      );
    });
  }
}
