import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/earnings_screen/earnings_screen.dart';
import 'package:project_way/view/screen/responsive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.bgBlue,
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
              "Profile",
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)
                  : TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
            ),
          ),
          body: ResponsiveWidget(
            mobile: Center(
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
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EarningsScreen(),
                                ));
                          },
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
            //FOR TAB
            tab: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 180,
                      width: 600,
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
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.amber,
                                    child: Image.asset(
                                      ImageConstant.Profile,
                                      fit: BoxFit.cover,
                                    )),
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: ColorConstant.defIndigo,
                                  child: CircleAvatar(
                                    backgroundColor: ColorConstant.defIndigo,
                                    radius: 10,
                                    child: Image.asset(
                                      ImageConstant.cameraIcon,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tony George",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "+91 974665155",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 750,
                    width: 600,
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
                          height: 400,
                          child: Image.asset(ImageConstant.Trophy),
                        ),
                        Text(
                          "₹ 1200.52",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        Text(
                          "Referal Count : 12",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EarningsScreen(),
                                ));
                          },
                          child: Container(
                            height: 70,
                            width: 350,
                            decoration: BoxDecoration(
                                color: ColorConstant.defIndigo,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                "View More",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Refer to earn",
                          style: TextStyle(
                              fontSize: 25,
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
          )),
    );
  }
}
