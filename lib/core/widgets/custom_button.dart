import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:flutter/material.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  final Color? color;
  final double? radius;
  final bool hasBorder;
  final void Function() action;
  final Color? textColor;
  final double? elevation;
  final TextStyle? textStyle;

  const CustomButton(
    this.title,
    this.action, {
    super.key,
    this.color,
    this.radius,
    this.hasBorder = false,
    this.textColor,
    this.elevation,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 25.0,
        left: size.width * 0.07,
        right: size.width * 0.07,
      ),
      width: size.width,
      child: Material(
        elevation: elevation ?? 2.0, // Butonun gölge efekti
        borderRadius: BorderRadius.circular(radius ?? 45),
        child: Ink(
          decoration: ShapeDecoration(
            color: color ?? AppColors.primaryColor,
            shape: hasBorder
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 45),
                    side: const BorderSide(
                      color: Color(0xff4498d8),
                      width: 1.5,
                    ),
                  )
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 45),
                  ),
          ),
          child: InkWell(
            onTap: action,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: DefaultTextStyle(
                  style: textStyle ??
                      TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: 18, // Yazı tipi boyutu
                        fontWeight: FontWeight.bold,
                      ),
                  child: title,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
