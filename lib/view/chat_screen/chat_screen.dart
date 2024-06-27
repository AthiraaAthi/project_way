import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/screen/responsive.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = 12;
    double containerHeight = 100;
    double containerWidth = 100;

    if (context.locale.languageCode == 'en') {
      //for solving the font and space issue according to our jsons
      fontSize = 15;
      containerHeight = 100;
      containerWidth = 200;
    } else if (context.locale.languageCode == 'ml') {
      containerHeight = 130;
      containerWidth = 200;
      fontSize = 12;
    }
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
                      )),
            title: MediaQuery.of(context).size.width < 600
                ? Text(
                    "chat.chatTitle".tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                : Text(
                    "chat.chatTitle".tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: MediaQuery.of(context).size.width < 600
                    ? Text(
                        "chat.clearChat".tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w300),
                      )
                    : Text(
                        "chat.clearChat".tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
              ),
            ],
          ),
          body: ResponsiveWidget(
            mobile: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 212, 212),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "1-5-2024",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8bd3b3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.question1".tr(),
                                style: TextStyle(fontSize: fontSize),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "11:10:am",
                                        style: TextStyle(fontSize: fontSize),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), /////////A Chat 1/////
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: containerHeight,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8fd2ce),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.answer1".tr(),
                                style: TextStyle(fontSize: fontSize),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "11:10:am",
                                      style: TextStyle(fontSize: fontSize),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), ///////////CHAT 2
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8bd3b3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.question2".tr(),
                                style: TextStyle(fontSize: fontSize),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "11:11:am",
                                      style: TextStyle(fontSize: fontSize),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), ///////////CHAT 3
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 90,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8fd2ce),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.answer2".tr(),
                                style: TextStyle(fontSize: fontSize),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "11:12:am",
                                      style: TextStyle(fontSize: fontSize),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), ///////////CHAT 4
                  SizedBox(
                    height: context.locale.languageCode == 'en'
                        ? 45
                        : 20, //for solving the space issue according to our jsons
                  ),

                  Row(
                    children: [
                      Container(
                        height: 41,
                        width: 265,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 192, 190, 190))),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            suffixIcon: Icon(
                              Icons.attach_file,
                              color: ColorConstant.defIndigo,
                            ),
                            hintText: "chat.hintText".tr(),
                            hintStyle: TextStyle(
                                fontSize: fontSize,
                                color:
                                    const Color.fromARGB(255, 192, 190, 190)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConstant.defIndigo,
                          ),
                          Icon(
                            Icons.mic_none_rounded,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            //FOR TAB////////////
            tab: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 212, 212),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "1-5-2024",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8bd3b3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.question1".tr(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "11:10:am",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), /////////A Chat 1/////
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8fd2ce),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.answer1".tr(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "11:10:am",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), ///////////CHAT 2
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 90,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8bd3b3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.question2".tr(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "11:11:am",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), ///////////CHAT 3
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xff8fd2ce),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "chat.answer2".tr(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "11:12:am",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ), ///////////CHAT 4
                  SizedBox(
                    height: 250,
                  ),

                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 650,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 192, 190, 190))),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            suffixIcon: Icon(
                              Icons.attach_file,
                              color: ColorConstant.defIndigo,
                              size: 30,
                            ),
                            hintText: "chat.hintText".tr(),
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 192, 190, 190),
                                fontSize: 20),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: ColorConstant.defIndigo,
                          ),
                          Icon(
                            Icons.mic_none_rounded,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
