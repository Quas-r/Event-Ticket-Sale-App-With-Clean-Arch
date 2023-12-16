import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  configureDependencies();
  prefs = await SharedPreferences.getInstance();
  runApp(const EventTicketSaleApp());
}
