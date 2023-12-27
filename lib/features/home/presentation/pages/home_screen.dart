import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/custom_font.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/utils/navigator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/custom_button.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/loading_indicator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/presentation/pages/ticket_list_screen.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/logic_holder/home_logic_holder/home_screen_logic_holder.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/widgets/app_expansion_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenLogicHolder logicHolder = locator<HomeScreenLogicHolder>();
  List<bool> _isExpandedList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    logicHolder.getEvents().then((value) {
      setState(() {
        _isExpandedList = List.generate(value.length, (_) => false);
      });
    });
  }

  void scrollTo(double destination) {
    _scrollController.animateTo(
      destination, 
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor.withOpacity(0.3),
      body: Observer(
        builder: (_) {
          return logicHolder.isEventsLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: LoadingIndicator(),
                  ),
                )
              : SingleChildScrollView(
                  controller: _scrollController,
                  child: AppExpansionPanelList(
                    expansionCallback: (panelIndex, isExpanded) {
                      setState(() {
                        _isExpandedList[panelIndex] = !isExpanded;
                      });
                    },
                    children:
                        logicHolder.events.map<AppExpansionPanel>((event) {
                      final index = logicHolder.events.indexOf(event);
                      return AppExpansionPanel(
                        iconBuilder: (child, isExpanded) {
                          return null;
                        },
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpandedList[index] = !isExpanded;
                                scrollTo(index.toDouble() * size.height / 4);
                              });
                            },
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              color: AppColors.themeColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    alignment: Alignment.topCenter,
                                    !_isExpandedList[index]
                                        ? event.eventImage ??
                                            "assets/events/daftpunk.png"
                                        : event.eventImage2 ??
                                            "assets/events/taylor_swift2.png",
                                    width: size.width,
                                    height: _isExpandedList[index]
                                        ? size.height *
                                            0.54
                                        : size.height /
                                            4,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: size.width / 2,
                                    right: 0,
                                    child: Container(
                                      height: 40,
                                      width: 200,
                                      color: AppColors.themeColor,
                                      child: Center(
                                        child: Text(
                                          event.eventName ?? "No Name",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        body: Container(
                          color: AppColors.themeColor.withOpacity(0.8),
                          width: size.width,
                          height: size.height * 0.25,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  event.eventDescription ??
                                      "Event Description Not Found",
                                  style: customFont(
                                      color: Colors.white,
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: CustomButton(
                                    Text(
                                      "Buy Your Ticket",
                                      style: customFont(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    color: AppColors.headerColor,
                                    radius: 6, () {
                                  CustomNavigator().push(
                                    context,
                                    TicketListScreen(
                                        logicHolder.events[index].id ??
                                            "00000000-0000-0000-0000-000000000000",
                                        logicHolder.events[index].eventName ??
                                            ""),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                        isExpanded: _isExpandedList[index],
                      );
                    }).toList(),
                  ),
                );
        },
      ),
    );
  }
}
