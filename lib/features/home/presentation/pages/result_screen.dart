import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/main_screen.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/widgets/ticke_info_widget_horizontal.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/widgets/ticket_info_widget_horizontal_long.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/widgets/ticket_info_widget_single.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/consts/colors/colors.dart';

class ResultScreen extends StatelessWidget {
  
  final String eventName;
  final int ticketCount;
  final double totalPrice;
  final String selectedBlock;
  final EventDetailEntity eventDetailEntity;

  ResultScreen({
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
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.home),
          onPressed: () {
            CustomNavigator().push(context, const MainScreen());
          },
        ),
        title: Text(
          "Payment Successfull!",
          style: customFont(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 10),
            TicketInfoHorizontalWidget("Event Name", eventName),
            const SizedBox(height: 10),
            TicketInfoHorizontalLongWidget("Event Location", eventDetailEntity.eventLocation ?? ""),
            const SizedBox(height: 10),
            TicketInfoHorizontalWidget("Event Date", eventDetailEntity.eventDate ?? ""),
            const SizedBox(height: 10),
            TicketInfoHorizontalWidget("Event Time", eventDetailEntity.eventTime ?? ""),
            const SizedBox(height: 10),
            TicketInfoHorizontalWidget("Selected Block", selectedBlock),
            const SizedBox(height: 10),
            TicketInfoHorizontalWidget("Ticket Count", "$ticketCount"),
            const SizedBox(height: 10),
            TicketInfoHorizontalWidget("Total Price", "\$$totalPrice"),
          ],
        ),
      ),
    );
  }
}
