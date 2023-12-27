import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:flutter/material.dart';

class TicketInfoSingleWidget extends StatelessWidget {
  const TicketInfoSingleWidget(
    this.value, {
    super.key,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.headerColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: customFont(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
