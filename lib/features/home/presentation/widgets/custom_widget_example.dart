import 'package:flutter/material.dart';

class CustomWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Bu, özel bir widget.",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
