import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  String? value;
  final List<String> items;
  final void Function(String?)? onChanged;
  final Color? dropdownColor;
  final Color? itemColor;
  final Color? textColor;
  final double elevation;
  final String? hintText;

  CustomDropdown(
      {required this.value,
      required this.items,
      required this.onChanged,
      this.dropdownColor,
      this.itemColor,
      this.textColor,
      this.elevation = 8.0,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(

        color: dropdownColor ?? AppColors.headerColor.withOpacity(0.7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              hintText ?? "Select an Item",
              style: customFont(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
            Center(
              child: DropdownButton<String>(
                hint: Text(
                  "",
                  style: customFont(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                value: value,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                iconSize: 24,
                elevation: elevation.toInt(),
                onChanged: onChanged,
                style: TextStyle(color: textColor ?? Colors.black),
                underline: const SizedBox(),
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: customFont(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
