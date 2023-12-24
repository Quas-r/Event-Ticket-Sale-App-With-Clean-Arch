import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_appbar.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/loading_indicator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_dates_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/logic_holder/home_logic_holder/home_screen_logic_holder.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/block_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/utils/navigator.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen(
    this.logicHolder,
    this.eventId,
    this.eventName, {
    super.key,
  });

  final HomeScreenLogicHolder logicHolder;
  final String eventId;
  final String eventName;

  @override
  _TicketListScreenState createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  @override
  void initState() {
    super.initState();
    widget.logicHolder.getEventDates(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
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
      body: Observer(builder: (_) {
        return widget.logicHolder.isEventDatesLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: LoadingIndicator(),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.logicHolder.eventDates?.eventImage ??
                        "assets/events/daftpunk.png",
                    height: size.height / 3,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: size.height / 20,
                    color: AppColors.headerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            textAlign: TextAlign.start,
                            "Dates",
                            style: customFont(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          widget.logicHolder.eventDates?.eventDetails?.length ??
                              0,
                      itemBuilder: (context, index) {
                        final eventDetail =
                            widget.logicHolder.eventDates?.eventDetails?[index];
                        return Container(
                          color: AppColors.headerColor,
                          child: GestureDetector(
                            onTap: () {
                              CustomNavigator().push(
                                context,
                                BlockScreen(
                                    widget.eventId,
                                    widget.eventName,
                                    eventDetail ?? EventDetailEntity()),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(0.3),
                              color: AppColors.themeColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: SizedBox(
                                height: size.height / 15,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      textAlign: TextAlign.center,
                                      eventDetail?.eventDate ?? "No date",
                                      style: customFont(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        eventDetail?.eventLocation ??
                                            "No location",
                                        style: customFont(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
