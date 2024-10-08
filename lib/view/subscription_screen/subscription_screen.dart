import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/screen/responsive.dart';
import 'package:project_way/view/subscription_screen/subscription_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});
  final space = SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgIndigo,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
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
          backgroundColor: ColorConstant.defIndigo,
          title: Text(
            "subscriptionScreen.subscriptionPlans".tr(),
            style: MediaQuery.of(context).size.width < 600
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)
                : TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
          ),
        ),
        body: ResponsiveWidget(
          mobile: SingleChildScrollView(
            child: Column(
              children: [
                SubscriptionWidget(
                  Title: "subscriptionScreen.bronzePackage".tr(),
                  first: "subscriptionScreen.aiChat".tr(),
                  second: "subscriptionScreen.budgetHandling".tr(),
                  third: "subscriptionScreen.bronzeReferalIncome".tr(),
                  price: "subscriptionScreen.bronzePrice".tr(),
                ),
                SubscriptionWidget(
                  Title: "subscriptionScreen.silverPackage".tr(),
                  first: "subscriptionScreen.aiChat".tr(),
                  second: "subscriptionScreen.budgetHandling".tr(),
                  third: "subscriptionScreen.silverReferalIncome".tr(),
                  price: "subscriptionScreen.silverPrice".tr(),
                ),
                SubscriptionWidget(
                  Title: "subscriptionScreen.goldPackage".tr(),
                  first: "subscriptionScreen.aiChat".tr(),
                  second: "subscriptionScreen.budgetHandling".tr(),
                  third: "subscriptionScreen.goldReferalIncome".tr(),
                  price: "subscriptionScreen.goldPrice".tr(),
                ),
                space
              ],
            ),
          ),
          //FOR TAB
          tab: SingleChildScrollView(
            child: Column(
              children: [
                SubscriptionWidget(
                  Title: "subscriptionScreen.bronzePackage".tr(),
                  first: "subscriptionScreen.aiChat".tr(),
                  second: "subscriptionScreen.budgetHandling".tr(),
                  third: "subscriptionScreen.bronzeReferalIncome".tr(),
                  price: "subscriptionScreen.bronzePrice".tr(),
                ),
                SubscriptionWidget(
                  Title: "subscriptionScreen.silverPackage".tr(),
                  first: "subscriptionScreen.aiChat".tr(),
                  second: "subscriptionScreen.budgetHandling".tr(),
                  third: "subscriptionScreen.silverReferalIncome".tr(),
                  price: "subscriptionScreen.silverPrice".tr(),
                ),
                SubscriptionWidget(
                  Title: "subscriptionScreen.goldPackage".tr(),
                  first: "subscriptionScreen.aiChat".tr(),
                  second: "subscriptionScreen.budgetHandling".tr(),
                  third: "subscriptionScreen.goldReferalIncome".tr(),
                  price: "subscriptionScreen.goldPrice".tr(),
                ),
                space
              ],
            ),
          ),
        ),
      ),
    );
  }
}
