import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/pages/result_screen.dart';
import 'package:flutter/material.dart';

class MyTicketsScreen extends StatelessWidget {
  MyTicketsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> eventList = [
    {
      'eventImage': 'assets/events/lorde2.png',
      'eventName': 'Lorde',
      'eventPrice': 450,
      "eventLocation": "Roy Thomson Hall",
      "eventTime": "10.00 PM",
      "eventDate": "26.03.2024"
    },
    {
      'eventImage': 'assets/events/daftpunk.png',
      'eventName': 'Daftpunk',
      'eventPrice': 450,
      "eventLocation": "London Bridge",
      "eventTime": "12.00 PM",
      "eventDate": "27.03.2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: eventList.length,
        itemExtent: size.height / 5,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              CustomNavigator().push(
                  context,
                  ResultScreen(
                      isCreated: false,
                      eventName: eventList[index]['eventName'],
                      ticketCount: 2,
                      totalPrice:
                          (eventList[index]['eventPrice'] * 2).toDouble(),
                      selectedBlock: "Block 1",
                      eventDetailEntity: EventDetailsSubEntity(
                          eventParticularId: "",
                          eventDate: eventList[index]['eventDate'],
                          eventTime: eventList[index]['eventTime'],
                          eventLocation: eventList[index]['eventLocation'],
                          eventPrice: "")));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: const Color.fromRGBO(203, 194, 185, 1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  height: size.height / 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                eventList[index]['eventImage'],
                              )),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        width: size.width / 2.5,
                        height: size.height / 5,
                      ),
                      const SizedBox(width: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              eventList[index]['eventName'],
                              style: customFont(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(eventList[index]['eventDate'],
                                style: customFont(
                                    color: AppColors.headerColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
