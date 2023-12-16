import 'package:flutter/material.dart';

class CustomNavigator {
  push(BuildContext context, Widget page) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  replacePush(BuildContext context, Widget page) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  hardPush(BuildContext context, Widget page) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  pop(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    });
    Navigator.pop(context);
  }
}
