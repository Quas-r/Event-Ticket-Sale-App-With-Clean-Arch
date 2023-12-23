import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_appbar.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/loading_indicator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/logic_holder/home_logic_holder/home_screen_logic_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen(
    this.logicHolder,
    this.eventId,{
    super.key,
  });

  final HomeScreenLogicHolder logicHolder;
  final String eventId;

  @override
  _TicketListScreenState createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {


  @override
  void initState() {
    super.initState();
    //widget.logicHolder.getEvents();
    widget.logicHolder.getEventDates(widget.eventId).then((value) => print(value[0].id));
    //widget.logicHolder.getEventDetails(widget.eventId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text("Date List"),
      ),
      backgroundColor: AppColors.themeColor.withOpacity(0.5),
      body: Observer(
        builder: (_) {
          // return widget.logicHolder.isTicketListLoading
          //   ? SizedBox(
          //       height: MediaQuery.of(context).size.height / 4,
          //       width: MediaQuery.of(context).size.width,
          //       child: const Center(
          //         child: LoadingIndicator(),
          //       ),
          //     )
          //   : 
          return widget.logicHolder.isEventDatesLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: LoadingIndicator(),
                ),
              )
            : 
            // bu bir liste döndürücü. bunu kullanmak zorunda değilsiniz tabi.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.logicHolder.event_dates[0].eventImage ?? "assets/events/daftpunk.png",
                  width: size.width,
                  height: size.height / 4,
                  fit: BoxFit.cover,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                textAlign: TextAlign.start,
                "Dates",
                style:  TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                ),),
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.black,
              ),
            ],
          ),
                Expanded(
                  child: ListView.builder(
                  
                        // normalde burda bir eventin bütün tarihlerdeki listesini görecek şekilde ayarlamak lazım
                        // onun için de getTicketList vs adında bir usecase ve onun data
                        // ve presentationdaki bağlantılarını yaptıktan sonra burda
                        // widget.logicHolder.ticketList.length şeklinde ayarlarsınız
                        // ben şimdilik göstermelik olarak event listesindeki ilk itemi dönüyorum
                        itemCount: widget.logicHolder.event_dates.length,
                        itemBuilder: (context, index) {
                          final eventDate = widget.logicHolder.event_dates[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Card(
                              color: AppColors.themeColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Container(
                                height: 40,
                                width: 200,
                                color: AppColors.themeColor,
                                child: Row(

                                  children: [
                                    Icon(
                                        Icons.calendar_month,
                                        color: Colors.black,
                                      ),

                                    Text(
                                      textAlign: TextAlign.center,
                                      eventDate.eventDate ?? "No date",
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "No datejjjjjjjjjjjjjjjjjjjjjjjjjjjjj",
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                ),
              ],
            );
        }
      ),
    );
  }
}
