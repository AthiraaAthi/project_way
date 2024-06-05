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
          toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
          backgroundColor: ColorConstant.defIndigo,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: MediaQuery.of(context).size.width < 600
                ? Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
          title: Text(
            "My Earnings",
            style: MediaQuery.of(context).size.width < 600
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)
                : TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Earnings : ₹ 1200.52",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                EarningsWidget(
                  title: "Referal Amount",
                  dateTime: "21-5-2024  11:50:AM",
                  subtitle:
                      "Referal Amount from way team after joining of Raghu Kumar",
                  amount: "+ ₹ 25.5",
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  title: "Referal Amount",
                  dateTime: "21-5-2024  11:50:AM",
                  subtitle:
                      "Referal Amount from way team after joining of Raghu Kumar",
                  amount: "+ ₹ 25.5",
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  title: "Referal Amount",
                  dateTime: "21-5-2024  11:50:AM",
                  subtitle:
                      "Referal Amount from way team after joining of Raghu Kumar",
                  amount: "+ ₹ 25.5",
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  title: "Referal Amount",
                  dateTime: "21-5-2024  11:50:AM",
                  subtitle:
                      "Referal Amount from way team after joining of Raghu Kumar",
                  amount: "+ ₹ 25.5",
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  title: "Referal Amount",
                  dateTime: "21-5-2024  11:50:AM",
                  subtitle:
                      "Referal Amount from way team after joining of Raghu Kumar",
                  amount: "+ ₹ 25.5",
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
