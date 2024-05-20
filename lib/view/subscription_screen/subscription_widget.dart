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
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Container(
        height: 230,
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
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(first),
              Text(second),
              Text(third),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(
                      color: ColorConstant.defIndigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
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
