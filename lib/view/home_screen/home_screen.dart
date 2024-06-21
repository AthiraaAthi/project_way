import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/budget_goal/budget_goal_screen.dart';
import 'package:project_way/view/category_screen/category_screen.dart';
import 'package:project_way/view/chat_screen/chat_screen.dart';
import 'package:project_way/view/coming_soon_screen/comingsoon_screen.dart';
import 'package:project_way/view/diary_screen/dairy_screen.dart';
import 'package:project_way/view/home_screen/homescreen_widget.dart';
import 'package:project_way/view/notifications_screen/notifications_screen.dart';
import 'package:project_way/view/passwords_screen/passwords_screen.dart';
import 'package:project_way/view/profile/profile_screen.dart';
import 'package:project_way/view/reports_screen/reports_screen.dart';
import 'package:project_way/view/screen/responsive.dart';
import 'package:project_way/view/subscription_screen/subscription_screen.dart';
import 'package:project_way/view/track_budget_screen/track_budget_screen.dart';

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
  final List<Map<String, dynamic>> quickLinks = [
    {'icon': Icons.show_chart, 'label': 'quickLinks.TrackBuget_label'},
    {'icon': Icons.track_changes, 'label': 'quickLinks.BudgetGoal_label'},
    {'icon': Icons.category, 'label': 'quickLinks.Categories_label'},
    {'icon': Icons.insert_chart, 'label': 'quickLinks.Reports_label'},
    {'icon': Icons.lock, 'label': 'quickLinks.Passwords_label'},
    {'icon': Icons.book, 'label': 'quickLinks.diary_label'},
    {'icon': Icons.chat, 'label': 'quickLinks.chat_label'},
    {'icon': Icons.subscriptions, 'label': 'quickLinks.subscription_label'},
    {'icon': Icons.shopping_cart, 'label': 'quickLinks.shopping_label'},
  ];

  List<Widget> Screens = [
    TrackBudgetScreen(),
    BudgetGoalScreen(),
    CategoriesScreen(),
    ReportsScreen(),
    PasswordsScreen(),
    MyDiaryScreen(),
    ChatScreen(),
    SubscriptionScreen(),
    ComingSoonScreen()
  ];
  int currentIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
              backgroundColor: ColorConstant.defIndigo,
              leading: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                  width: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                  decoration: BoxDecoration(
                    color: ColorConstant.defIndigo,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.Logo),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              title: MediaQuery.of(context).size.width < 600
                  ? Text(
                      'app.title'.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(
                      'app.title'.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
              actions: [
                Row(
                  children: [
                    MediaQuery.of(context).size.width < 600
                        ? Text(
                            'toolbarItems.ai'.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'toolbarItems.ai'.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                    SizedBox(
                      width: 5,
                    ),
                    MediaQuery.of(context).size.width < 600
                        ? Transform.scale(
                            scale: 0.7,
                            child: Switch(
                              inactiveTrackColor: Colors.white,
                              thumbColor: WidgetStatePropertyAll(
                                  ColorConstant.defIndigo),
                              activeTrackColor:
                                  const Color.fromARGB(255, 12, 223, 19),
                              value: isSelected,
                              onChanged: (setvalue) {
                                setState(() {
                                  isSelected = setvalue;
                                });
                              },
                            ),
                          )
                        : Transform.scale(
                            scale: 0.9,
                            child: Switch(
                              inactiveTrackColor: Colors.white,
                              thumbColor: WidgetStatePropertyAll(
                                  ColorConstant.defIndigo),
                              activeTrackColor:
                                  const Color.fromARGB(255, 12, 223, 19),
                              value: isSelected,
                              onChanged: (setvalue) {
                                setState(() {
                                  isSelected = setvalue;
                                });
                              },
                            ),
                          )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    },
                    child: MediaQuery.of(context).size.width < 600
                        ? Icon(
                            Icons.person,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          )),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ));
                    },
                    child: MediaQuery.of(context).size.width < 600
                        ? Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 40,
                          )),
                SizedBox(
                  width: 20,
                ),
              ]),
          backgroundColor: ColorConstant.bgBlue,
          body: ResponsiveWidget(
            mobile: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
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
                            'app.quickLinksTitle'.tr(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        itemCount: quickLinks.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 100,
                        ),
                        itemBuilder: (context, index) => HomeScreenWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screens[index],
                                ));
                          },
                          icon: quickLinks[index]['icon'],
                          text: tr(quickLinks[index]['label']),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //FOR TAB
            tab: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: 550,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
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
                              height: 15,
                              width: 15,
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
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800),
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
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 40,
                            mainAxisExtent: 160),
                        itemBuilder: (context, index) => HomeScreenWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screens[index],
                                ));
                          },
                          icon: quickLinks[index]['icon'],
                          text: tr(quickLinks[index]['label']),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
