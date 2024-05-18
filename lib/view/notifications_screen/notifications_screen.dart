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
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0.5,
                        offset: Offset(0, 5),
                        spreadRadius: 0.1)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: ColorConstant.defIndigo,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "My Notifications title",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elit,Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
