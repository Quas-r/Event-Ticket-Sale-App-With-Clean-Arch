import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/widgets/ticke_info_widget_horizontal.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/widgets/ticket_info_widget_horizontal_long.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/widgets/ticket_info_widget_single.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/consts/colors/colors.dart';

class ResultScreen extends StatelessWidget {

  final bool isCreated;
  final String eventName;
  final int ticketCount;
  final double totalPrice;
  final String selectedBlock;
  final EventDetailsSubEntity eventDetailEntity;

  ResultScreen({
    required this.isCreated,
    required this.eventName,
    required this.ticketCount,
    required this.totalPrice,
    required this.selectedBlock,
    required this.eventDetailEntity,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: isCreated ? IconButton(
          color: Colors.black,
          icon: const Icon(Icons.home),
          onPressed: () {
            CustomNavigator().push(context, const MainScreen());
          },
        ): IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        title: Text(
          "Your $eventName Ticket",
          style: customFont(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const TicketInfoSingleWidget("QR Code For Event Entrance"),
                  const SizedBox(height: 10),
                  QrImageView(
                    data: "qrData",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TicketInfoHorizontalWidget("Event Name", eventName),
            TicketInfoHorizontalLongWidget("Event Location", eventDetailEntity.eventLocation ?? ""),
            TicketInfoHorizontalWidget("Event Date", eventDetailEntity.eventDate ?? ""),
            TicketInfoHorizontalWidget("Event Time", eventDetailEntity.eventTime ?? ""),
            TicketInfoHorizontalWidget("Selected Block", selectedBlock),
            TicketInfoHorizontalWidget("Ticket Count", "$ticketCount"),
            TicketInfoHorizontalWidget("Total Price", "\$$totalPrice"),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
