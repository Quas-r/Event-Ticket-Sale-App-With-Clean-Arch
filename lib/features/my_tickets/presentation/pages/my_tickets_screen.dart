import 'package:event_ticket_sale_app_with_clean_arch/features/my_tickets/presentation/logic_holder/my_tickets_logic_holder.dart';
import 'package:flutter/material.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  @override
  final MyTicketsLogicHolder logicHolder = locator<MyTicketsLogicHolder>();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png", 
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "My Tickets", 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tickets"),
      ),
      body: const Center(
        child: Text("Welcome!"),
      ),
    );
  }
}
