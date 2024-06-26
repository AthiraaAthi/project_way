import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/screen/responsive.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.bgBlue,
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
            backgroundColor: ColorConstant.defIndigo,
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
            title: Text(
              "notifications.notificationAppbar".tr(),
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
            mobile: Padding(
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
                              offset: Offset(0, 2),
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
                                  "notifications.notificationTitle".tr(),
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "notifications.notificationBody".tr(),
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
            //FOR TAB
            tab: Padding(
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
                    height: 220,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              offset: Offset(0, 2),
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
                                  radius: 12,
                                  backgroundColor: ColorConstant.defIndigo,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "notifications.notificationTitle".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              "notifications.notificationBody".tr(),
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
