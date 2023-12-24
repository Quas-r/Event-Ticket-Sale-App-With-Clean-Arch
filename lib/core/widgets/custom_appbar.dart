import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  final String title;
  final bool showBackButton;
  List<Widget> actions;
  final Function()? onBackButtonPressed;

  CustomAppBar({
    required this.title,
    this.showBackButton = false,
    this.onBackButtonPressed,
    List<Widget>? acts,
  }) : actions = acts ?? [];

  AppBar getStandardWidget() {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 50),
          Text(
            textAlign: TextAlign.center,
            title,
            style: customFont(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      actions: [
        const SizedBox(width: 16),
        Row(
          children: [
            SizedBox(
              width: 80, 
              child: Text(
                'İzmir',
                textAlign: TextAlign.end,
                style: customFont(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ],
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onBackButtonPressed,
            )
          : IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {

              },
            ),
    );
  }
}
