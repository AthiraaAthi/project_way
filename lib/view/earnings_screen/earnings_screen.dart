import 'package:easy_localization/easy_localization.dart';
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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
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
                      size: 34,
                    ),
            ),
          ),
          title: Text(
            "earningsScreen.earnings_appbar".tr(),
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
                  "earningsScreen.totalEarnings".tr(),
                  style: MediaQuery.of(context).size.width < 600
                      ? TextStyle(fontWeight: FontWeight.w800, fontSize: 14)
                      : TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width < 600 ? 20 : 30,
                ),
                EarningsWidget(
                  date: "earningsScreen.earnings_Date".tr(),
                  title: "earningsScreen.earnings_title".tr(),
                  Time: "earningsScreen.earnings_time".tr(),
                  subtitle: "earningsScreen.earnings_subtitle".tr(),
                  amount: "earningsScreen.earnings_amount".tr(),
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  date: "earningsScreen.earnings_Date".tr(),
                  title: "earningsScreen.earnings_title".tr(),
                  Time: "earningsScreen.earnings_time".tr(),
                  subtitle: "earningsScreen.earnings_subtitle".tr(),
                  amount: "earningsScreen.earnings_amount".tr(),
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  date: "earningsScreen.earnings_Date".tr(),
                  title: "earningsScreen.earnings_title".tr(),
                  Time: "earningsScreen.earnings_time".tr(),
                  subtitle: "earningsScreen.earnings_subtitle".tr(),
                  amount: "earningsScreen.earnings_amount".tr(),
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  date: "earningsScreen.earnings_Date".tr(),
                  title: "earningsScreen.earnings_title".tr(),
                  Time: "earningsScreen.earnings_time".tr(),
                  subtitle: "earningsScreen.earnings_subtitle".tr(),
                  amount: "earningsScreen.earnings_amount".tr(),
                  color: ColorConstant.defGreen,
                  amountColor: ColorConstant.defGreen,
                ),
                EarningsWidget(
                  date: "earningsScreen.earnings_Date".tr(),
                  title: "earningsScreen.earnings_title".tr(),
                  Time: "earningsScreen.earnings_time".tr(),
                  subtitle: "earningsScreen.earnings_subtitle".tr(),
                  amount: "earningsScreen.earnings_amount".tr(),
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
