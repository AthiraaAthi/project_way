import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/coming_soon_screen/comingsoon_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: ColorConstant.defIndigo,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          offset: Offset(0, 2),
                          spreadRadius: 0.1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.asset(ImageConstant.Profile),
                        CircleAvatar(
                          radius: 11,
                          backgroundColor: ColorConstant.defIndigo,
                          child: CircleAvatar(
                            backgroundColor: ColorConstant.defIndigo,
                            radius: 5,
                            child: Image.asset(
                              ImageConstant.cameraIcon,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      ],
                    ),
                    title: Text(
                      "Tony George",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                    subtitle: Text(
                      "+91 974665155",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 450,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          offset: Offset(0, 2),
                          spreadRadius: 0.1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: Image.asset(ImageConstant.Trophy),
                    ),
                    Text(
                      "₹ 1200.52",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Text(
                      "Referal Count : 12",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                            color: ColorConstant.defIndigo,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Refer to earn",
                      style: TextStyle(
                          color: ColorConstant.defIndigo,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}
