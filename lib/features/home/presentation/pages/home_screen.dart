import 'package:event_ticket_sale_app_with_clean_arch/core/app/event_ticket_sale_app.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/consts/colors/colors.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/locator/service_locator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/widgets/loading_indicator.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/logic_holder/home_logic_holder/home_screen_logic_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenLogicHolder logicHolder = locator<HomeScreenLogicHolder>();

  @override
  void initState() {
    super.initState();
    logicHolder.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor.withOpacity(0.3),
      body: Observer(builder: (_) {
        return logicHolder.isEventsLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: LoadingIndicator(),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.8,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: logicHolder.events.length,
                itemBuilder: (context, index) {
                  final event = logicHolder.events[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: AppColors.themeColor,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            event.eventImage ?? "assets/events/daftpunk.png",
                            width: size.width,
                            height: size.height / 4,
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
                                  textAlign: TextAlign.center,
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
              );
      }),
    );
  }
}
