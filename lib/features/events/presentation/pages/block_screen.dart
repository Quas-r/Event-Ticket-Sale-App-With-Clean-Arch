import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_dropdown.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/pages/payment_screen.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/widgets/ticket_info_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/event_ticket_sale_app.dart';
import '../../../../core/consts/colors/colors.dart';
import '../../../../core/utils/navigator.dart';

class BlockScreen extends StatefulWidget {
  const BlockScreen(
    this.eventId,
    this.eventName,
    this.eventDetailEntity, {
    super.key,
  });

  final String eventId;
  final String eventName;
  final EventDetailsSubEntity eventDetailEntity;

  @override
  _BlockScreenState createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  String? selectedBlockDropdownValue;
  String? selectedTicketCountDropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.eventName,
          style: customFont(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      backgroundColor: AppColors.themeColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/events/blocks.png",
                fit: BoxFit.fill,
                height: size.height / 2.75,
              ),
              const SizedBox(height: 10),
              TicketInfoWidget("Event Location",
                  widget.eventDetailEntity.eventLocation ?? ""),
              const SizedBox(height: 10),
              TicketInfoWidget(
                  "Event Date", widget.eventDetailEntity.eventDate ?? ""),
              const SizedBox(height: 10),
              TicketInfoWidget(
                  "Event Time", widget.eventDetailEntity.eventTime ?? ""),
              const SizedBox(height: 10),
              CustomDropdown(
                hintText: "Select a Block",
                value: selectedBlockDropdownValue,
                items: const ['Block 1', 'Block 2'],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedBlockDropdownValue = newValue;
                    });
                  }
                },
              ),
              Container(color: Colors.black, height: 0.25),
              CustomDropdown(
                hintText: "Select Ticket Count",
                value: selectedTicketCountDropdownValue,
                items: const [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10'
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedTicketCountDropdownValue = newValue;
                    });
                  }
                },
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                if (selectedBlockDropdownValue != null &&
                    selectedTicketCountDropdownValue != null) {
                  CustomNavigator().push(
                    context,
                    PaymentScreen(
                      eventName: widget.eventName,
                      ticketCount:
                          int.parse(selectedTicketCountDropdownValue ?? "0"),
                      totalPrice:
                          int.parse(selectedTicketCountDropdownValue ?? "0")
                                  .toDouble() *
                              (int.parse(
                                  widget.eventDetailEntity.eventPrice ?? "0")),
                      selectedBlock: selectedBlockDropdownValue ?? "Block 1",
                      eventDetailEntity: widget.eventDetailEntity,
                    ),
                  );
                }
              },
              child: Container(
                color: (selectedBlockDropdownValue == null ||
                        selectedTicketCountDropdownValue == null)
                    ? AppColors.headerColor.withOpacity(0.01)
                    : AppColors.headerColor.withOpacity(0.7),
                height: 80,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Buy Your Ticket",
                      style: customFont(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
