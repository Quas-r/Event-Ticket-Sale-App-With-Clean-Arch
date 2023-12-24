import 'package:event_ticket_sale_app_with_clean_arch/features/home/presentation/pages/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/event_ticket_sale_app.dart';
import '../../../../core/consts/colors/colors.dart';
import '../../../../core/utils/navigator.dart';

class BlockScreen extends StatefulWidget {

  @override
  _BlockScreenState createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  @override
  void initState() {
    super.initState();

  }
  Color block1Color = AppColors.themeColor;
  Color block2Color = AppColors.themeColor;
  void changeColor() {
    setState(() {
      // Renk değişimi işlemi
      block1Color = block1Color == AppColors.themeColor ? AppColors.selectedBlockColor : AppColors.themeColor;
      block2Color = block1Color == AppColors.themeColor ? AppColors.selectedBlockColor : AppColors.themeColor;
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text("Blocks"),
      ),
      backgroundColor: AppColors.blockColor,
       body:
       Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
                "assets/events/blocks.png",
            //width: size.width,
            //height: size.height / 4,
            fit: BoxFit.cover,
          ),
          Container(
            color: AppColors.themeColor,
            height: 65,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Select Block",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                ),

              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // GestureDetector'ın üzerine tıklama (tap) algılandığında yapılacak işlemler
              changeColor();
            },
            child: Container(
              color: block1Color,
              height: 40,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.start,
                      "Block 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                // GestureDetector'ın üzerine tıklama (tap) algılandığında yapılacak işlemler
                changeColor();
              },
              child: Container(
                color: block2Color,
                height: 40,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Block 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Container(
              color: AppColors.blockColor, // Sayfanın geri kalanını kaplamak için
            ),
          ),
          GestureDetector(
            onTap: () {
              CustomNavigator().push(
                context,
                PaymentScreen(
                ),
              );
            },
            child: Container(

              color: AppColors.themeColor,
              height: 50,
              child: const Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Buy Your Ticket",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      )
    );

  }

}