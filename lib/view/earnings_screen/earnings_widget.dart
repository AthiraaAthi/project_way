import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class EarningsWidget extends StatelessWidget {
  const EarningsWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.subtitle,
      required this.amount,
      required this.color,
      required this.amountColor,
      required this.Time});
  final String title;
  final String date;
  final String Time;
  final String subtitle;
  final String amount;
  final Color color;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.width < 600 ? 95 : 150,
          width: MediaQuery.of(context).size.width < 600 ? 350 : 700,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    spreadRadius: 0.1,
                    blurRadius: 1)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height:
                              MediaQuery.of(context).size.width < 600 ? 12 : 22,
                          width:
                              MediaQuery.of(context).size.width < 600 ? 12 : 22,
                          color: color,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          title,
                          style: MediaQuery.of(context).size.width < 600
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.black,
                                  fontSize: 13.7)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.black,
                                  fontSize: 25),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          date,
                          style: MediaQuery.of(context).size.width < 600
                              ? TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w800)
                              : TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width < 600 ? 5 : 15,
                        ),
                        Text(
                          Time,
                          style: MediaQuery.of(context).size.width < 600
                              ? TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w800)
                              : TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          subtitle,
                          style: MediaQuery.of(context).size.width < 600
                              ? TextStyle(fontSize: 12)
                              : TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        amount,
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(
                                color: amountColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(
                                color: amountColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
