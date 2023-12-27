import 'package:event_ticket_sale_app_with_clean_arch/core/configs/build_config_manager.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../consts/colors/colors.dart';

late Size size;

class EventTicketSaleApp extends StatelessWidget {
  const EventTicketSaleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: config.appTitle,
      theme: ThemeData(
        fontFamily: 'DMSans',
        primaryColor: AppColors.primaryColor,
      ),
      debugShowCheckedModeBanner: (config is DeviceGestureSettings),
      routes: {
        SplashPage.route: (context) => const SplashPage(),
      },
      initialRoute: SplashPage.route,
    );
  }
}
