import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/screen/responsive.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.bgIndigo,
        body: ResponsiveWidget(
          mobile: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageConstant.ComingSoon),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Coming Soon",
                  style: TextStyle(
                      color: ColorConstant.defIndigo,
                      fontWeight: FontWeight.w400,
                      fontSize: 35),
                ),
              ],
            ),
          ),
          //FOR TAB
          tab: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      ImageConstant.ComingSoon,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Coming Soon",
                  style: TextStyle(
                      color: ColorConstant.defIndigo,
                      fontWeight: FontWeight.w400,
                      fontSize: 55),
                ),
              ],
            ),
          ),
        ));
  }
}
