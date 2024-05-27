import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            "Way Ai",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                "Clear Chat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
            )
          ],
        ),
        body: Padding(
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 78,
                    width: 185,
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
                            "Can you add 15000 Rupees in income plan of today's date",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "11:10:am",
                                style: TextStyle(fontSize: 10),
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
                height: 30,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 78,
                    width: 185,
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
                            "Yes we will add,before that we need to know what is the What is the category?",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "11:10:am",
                                style: TextStyle(fontSize: 10),
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 59,
                    width: 114,
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
                            "From our Estate",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "11:11:am",
                                style: TextStyle(fontSize: 10),
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
                height: 30,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 78,
                    width: 185,
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
                            "Yes we added according to your decisions",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "11:12:am",
                                style: TextStyle(fontSize: 10),
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
                height: 120,
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
                            color: const Color.fromARGB(255, 192, 190, 190))),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        suffixIcon: Icon(
                          Icons.attach_file,
                          color: ColorConstant.defIndigo,
                        ),
                        hintText: "enter your message",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 192, 190, 190)),
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
      ),
    );
  }
}
