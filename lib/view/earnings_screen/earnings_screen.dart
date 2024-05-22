import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/earnings_screen/earnings_widget.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
          backgroundColor: ColorConstant.defIndigo,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            "My Earnings",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Total Earnings : ₹ 1200.52",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
              ),
              EarningsWidget(
                  title: "Referal Amount",
                  dateTime: "21-5-2024  11:50:AM",
                  subtitle:
                      "Referal Amount from way team after joining of Raghu Kumar",
                  amount: "",
                  color: color,
                  amountColor: amountColor)
            ],
          ),
        ),
      ),
    );
  }
}
