import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class ViewDiaryScreen extends StatelessWidget {
  const ViewDiaryScreen(
      {super.key,
      required this.title,
      required this.content,
      required this.AppBarText});
  final String title;
  final String content;
  final String AppBarText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgBlue,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
        backgroundColor: ColorConstant.defIndigo,
        title: Text(
          "SHOWING ${AppBarText}'s DIARY",
          style: MediaQuery.of(context).size.width < 600
              ? TextStyle(fontWeight: FontWeight.w400, color: Colors.white)
              : TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 30),
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 26),
            Text(
              content,
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(fontSize: 16)
                  : TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
