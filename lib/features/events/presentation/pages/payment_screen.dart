import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_snackbar.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/pages/result_screen.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/widgets/card_number_formatter.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/widgets/expiry_date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentScreen extends StatefulWidget {
  final String eventName;
  final int ticketCount;
  final double totalPrice;
  final String selectedBlock;
  final EventDetailsSubEntity eventDetailEntity;

  PaymentScreen({
    required this.eventName,
    required this.ticketCount,
    required this.totalPrice,
    required this.selectedBlock,
    required this.eventDetailEntity,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  Color buttonColor = AppColors.headerColor.withOpacity(0.01);

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    cardNumberController.addListener(updateButtonState);
    expiryDateController.addListener(updateButtonState);
    cvvController.addListener(updateButtonState);
    super.initState();
  }

  void updateButtonState() {
    setState(() {
      if (cardNumberController.text.isNotEmpty &&
          expiryDateController.text.isNotEmpty &&
          cvvController.text.isNotEmpty) {
        buttonColor = AppColors.headerColor;
      } else {
        buttonColor = AppColors.headerColor.withOpacity(0.01);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Container(
          color: AppColors.themeColor.withOpacity(0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Payment Details',
                  style: customFont(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    _buildPaymentItem('Event Name', widget.eventName),
                    _buildPaymentItem(
                        'Ticket Count', widget.ticketCount.toString()),
                    _buildPaymentItem('Total Amount',
                        '\$${widget.totalPrice.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    color: AppColors.themeColor.withOpacity(0.8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Enter Card Details',
                              style: customFont(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            color: AppColors.header2Color.withOpacity(0.9),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                key: const Key("Card Number"),
                                style: customFont(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                controller: cardNumberController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(16),
                                  CardNumberInputFormatter(),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelStyle: customFont(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    labelText: 'Card Number',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  color:
                                      AppColors.header2Color.withOpacity(0.9),
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextField(
                                      key: const Key("Expiry Date"),
                                      style: customFont(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      controller: expiryDateController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                        ExpiryDateInputFormatter(),
                                      ],
                                      decoration: InputDecoration(
                                          labelStyle: customFont(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          labelText: 'Expiry Date (MM/YY)',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Card(
                                  color:
                                      AppColors.header2Color.withOpacity(0.9),
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextField(
                                      key: const Key("CVV"),
                                      style: customFont(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      controller: cvvController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      decoration: InputDecoration(
                                          labelStyle: customFont(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          labelText: 'CVV',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                key: const Key("Buy Button"),
                onTap: () {
                  if ((cardNumberController.text.isNotEmpty &&
                      expiryDateController.text.isNotEmpty &&
                      cvvController.text.isNotEmpty)) {
                    if (isPaymentInfoCorrect()) {
                      CustomNavigator().push(
                          context,
                          ResultScreen(
                            isCreated: true,
                            eventName: widget.eventName,
                            ticketCount: widget.ticketCount,
                            totalPrice: widget.totalPrice,
                            selectedBlock: widget.selectedBlock,
                            eventDetailEntity: widget.eventDetailEntity,
                          ));
                    } else {
                      cardNumberController.text = "";
                      expiryDateController.text = "";
                      cvvController.text = "";
                    }
                  }
                },
                child: Container(
                  color: buttonColor,
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
            ],
          ),
        ),
      ),
    );
  }

  bool isPaymentInfoCorrect() {
    String exampleCardNumber = "1111 1111 1111 1111";
    String exampleExpiryDate = "11/11";
    String exampleCVV = "111";
    print(cardNumberController.text);
    print(expiryDateController.text);
    print(cvvController.text);
    if (cardNumberController.text != exampleCardNumber ||
        expiryDateController.text != exampleExpiryDate ||
        cvvController.text != exampleCVV) {
      errorSnackBar(context, "Payment information is wrong");
      return false;
    } else {
      successSnackBar(context, "Payment is successful!");
      return true;
    }
  }

  Widget _buildPaymentItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: customFont(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: customFont(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
