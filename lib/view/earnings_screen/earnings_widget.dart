import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class EarningsWidget extends StatelessWidget {
  const EarningsWidget(
      {super.key,
      required this.title,
      required this.dateTime,
      required this.subtitle,
      required this.amount,
      required this.color,
      required this.amountColor});
  final String title;
  final String dateTime;
  final String subtitle;
  final String amount;
  final Color color;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 4),
                spreadRadius: 0.1,
                blurRadius: 1)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      color: color,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.black,
                          fontSize: 13.7),
                    ),
                  ],
                ),
                Text(
                  dateTime,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    amount,
                    style: TextStyle(color: amountColor, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
