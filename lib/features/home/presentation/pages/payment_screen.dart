import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_button.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/result_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String eventName;
  final int ticketCount;
  final double totalPrice;
  final String selectedBlock;
  final EventDetailEntity eventDetailEntity;

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

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ekrana herhangi bir yere tıklandığında klavyenin kapanması için FocusScope'u kullanın
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Payment Details',
                style: customFont(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              _buildPaymentItem('Event Name', widget.eventName),
              _buildPaymentItem('Ticket Count', widget.ticketCount.toString()),
              _buildPaymentItem(
                  'Total Amount', '\$${widget.totalPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 40),
              Expanded(
                child: Card(
                  color: AppColors.header2Color,
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
                          color: AppColors.themeColor,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: cardNumberController,
                              decoration: const InputDecoration(
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
                                color: AppColors.themeColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextField(
                                    controller: expiryDateController,
                                    decoration: const InputDecoration(
                                        labelText: 'Expiry Date (MM/YY)',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Card(
                                color: AppColors.themeColor,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextField(
                                    controller: cvvController,
                                    decoration: const InputDecoration(
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
              const SizedBox(height: 40),
              CustomButton(
                  color: AppColors.headerColor,
                  Text(
                    "Pay Now",
                    style: customFont(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ), () {
                    
                if(widget.totalPrice > 0){
                  CustomNavigator().push(
                    context,
                    ResultScreen(
                      eventName: widget.eventName,
                      ticketCount: widget.ticketCount,
                      totalPrice: widget.totalPrice,
                      selectedBlock: widget.selectedBlock,
                      eventDetailEntity: widget.eventDetailEntity,
                    ));
                }
              })
            ],
          ),
        ),
      ),
    );
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
