import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void infoSnackBar(BuildContext context, String title, {bool isTop = false}) {
  // ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
  // final snackBar = SnackBar(
  //   content: Text(title),
  //   backgroundColor: Colors.blue,
  //   behavior: SnackBarBehavior.floating,
  //   margin: isTop
  //       ? EdgeInsets.only(
  //           bottom: MediaQuery.of(context).size.height - 150,
  //           right: 20,
  //           left: 20,
  //         )
  //       : null,
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  AnimatedSnackBar.material(
    title,
    snackBarStrategy: RemoveSnackBarStrategy(),
    type: AnimatedSnackBarType.info,
  ).show(context);

}

void successSnackBar(BuildContext context, String title, {bool isTop = false}) {
  // ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
  // final snackBar = SnackBar(
  //   content: Text(title),
  //   backgroundColor: Colors.green,
  //   behavior: SnackBarBehavior.floating,
  //   margin: isTop
  //       ? EdgeInsets.only(
  //           bottom: MediaQuery.of(context).size.height - 150,
  //           right: 20,
  //           left: 20,
  //         )
  //       : null,
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  AnimatedSnackBar.material(
    title,
    type: AnimatedSnackBarType.success,
    snackBarStrategy: RemoveSnackBarStrategy(),
  ).show(context);
}

void errorSnackBar(BuildContext context, String title, {bool isTop = false}) {
  // ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
  // final snackBar = SnackBar(
  //   content: Text(title),
  //   backgroundColor: Colors.red,
  //   behavior: SnackBarBehavior.floating,
  //   margin: isTop
  //       ? EdgeInsets.only(
  //           bottom: MediaQuery.of(context).size.height - 150,
  //           right: 20,
  //           left: 20,
  //         )
  //       : null,
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  AnimatedSnackBar.material(
    title,
    type: AnimatedSnackBarType.error,
    snackBarStrategy: RemoveSnackBarStrategy(),
  ).show(context);
}
