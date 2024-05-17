import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> myList = [
    ImageConstant.Logo,
    "assets/images/carousal.png",
    ImageConstant.Logo,
    "assets/images/carousal.png",
  ];
  int currentIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: ColorConstant.defIndigo,
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: ColorConstant.defIndigo,
                    image:
                        DecorationImage(image: AssetImage(ImageConstant.Logo))),
              ),
            ),
            title: Text(
              "Way",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              Row(
                children: [
                  Text(
                    "Ai",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      inactiveTrackColor: Colors.white,
                      thumbColor:
                          MaterialStatePropertyAll(ColorConstant.defIndigo),
                      activeTrackColor: const Color.fromARGB(255, 12, 223, 19),
                      value: isSelected,
                      onChanged: (setvalue) {
                        setState(() {
                          isSelected = setvalue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
            ]),
        backgroundColor: ColorConstant.bgBlue,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 350,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: CarouselSlider.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index, realIndex) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(myList[index]),
                              fit: BoxFit.cover)),
                    ),
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            print(reason.toString());
                            currentIndex = index;
                          });
                        },
                        autoPlayInterval: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        autoPlay: true,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.9),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < myList.length; i++)
                      Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: currentIndex == i
                              ? ColorConstant.defIndigo
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Quick Links",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  itemCount: 9,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(0, 2))
                      ],
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.graphic_eq,
                          size: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("kwhfiw"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
