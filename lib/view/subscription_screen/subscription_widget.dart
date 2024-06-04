import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget(
      {super.key,
      required this.Title,
      required this.first,
      required this.second,
      required this.third,
      required this.price});
  final String Title;
  final String first;
  final String second;
  final String third;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width < 600
          ? EdgeInsets.only(top: 20, left: 30, right: 30)
          : EdgeInsets.only(top: 40, left: 70, right: 70),
      child: Container(
        height: MediaQuery.of(context).size.width < 600 ? 230 : 400,
        width: MediaQuery.of(context).size.width < 600 ? 330 : 630,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              offset: Offset(0, 2),
              spreadRadius: 0.1,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Title,
                style: MediaQuery.of(context).size.width < 600
                    ? TextStyle(fontWeight: FontWeight.w800, fontSize: 20)
                    : TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              Text(
                first,
                style: MediaQuery.of(context).size.width < 600
                    ? TextStyle()
                    : TextStyle(fontSize: 25),
              ),
              Text(
                second,
                style: MediaQuery.of(context).size.width < 600
                    ? TextStyle()
                    : TextStyle(fontSize: 22),
              ),
              Text(
                third,
                style: MediaQuery.of(context).size.width < 600
                    ? TextStyle()
                    : TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 20, left: 20, right: 20),
                child: Container(
                  height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                  width: MediaQuery.of(context).size.width < 600 ? 280 : 780,
                  decoration: BoxDecoration(
                      color: ColorConstant.defIndigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      price,
                      style: MediaQuery.of(context).size.width < 600
                          ? TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )
                          : TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
