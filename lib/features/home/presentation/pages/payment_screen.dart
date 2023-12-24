import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/consts/colors/colors.dart';

class PaymentScreen extends StatefulWidget {

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.themeColor,
          title: const Text("Payment"),
        ),
        backgroundColor: AppColors.blockColor,


    );
  }
}