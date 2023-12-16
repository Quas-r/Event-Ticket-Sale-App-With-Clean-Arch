import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        const SizedBox(width: 16),
        Row(
          children: [
            const SizedBox(
              width: 80, 
              child: Text(
                'İzmir',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
