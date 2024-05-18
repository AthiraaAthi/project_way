import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgBlue,
      appBar: AppBar(
        backgroundColor: ColorConstant.defIndigo,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 0.5,
                    offset: Offset(0, 5),
                    spreadRadius: 0.1)
              ]),
        ),
      ),
    );
  }
}
