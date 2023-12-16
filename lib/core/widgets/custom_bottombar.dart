import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/logic_holder/main_logic_holder.dart/main_logic_holder.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/main_screen.dart';

class CustomBottomBar {
  final MainLogicHolder logicHolder;
  CustomBottomBar(this.logicHolder);
  Observer bottomNavigationBar(BuildContext context,
      {bool isMainScreen = false}) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        backgroundColor: AppColors.themeColor,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: logicHolder.pageIndex,
        onTap: (int index) {
          logicHolder.pageIndex = index;
          if (!isMainScreen) {
            CustomNavigator().hardPush(context, const MainScreen());
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        selectedLabelStyle: customFont(color: Colors.black),
        unselectedLabelStyle: customFont(),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: logicHolder.pageIndex == 0
                  ? Colors.black
                  : Colors.white,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.theater_comedy,
              color: logicHolder.pageIndex == 1
                  ? Colors.black
                  : Colors.white,
            ),
            label: "My Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: logicHolder.pageIndex == 2
                  ? Colors.black
                  : Colors.white,
            ),
            label: "profile",
          ),
        ],
      );
    });
  }
}
