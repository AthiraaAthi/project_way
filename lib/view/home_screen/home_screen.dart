import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/budget_graph/budget_goal_screen.dart';
import 'package:project_way/view/category_screen/category_screen.dart';
import 'package:project_way/view/chat_screen/chat_screen.dart';
import 'package:project_way/view/diary_screen/dairy_screen.dart';
import 'package:project_way/view/home_screen/homescreen_widget.dart';
import 'package:project_way/view/passwords_screen/passwords_screen.dart';
import 'package:project_way/view/profile/profile_screen.dart';
import 'package:project_way/view/reports_screen/reports_screen.dart';
import 'package:project_way/view/shopping_screen/shopping_screen.dart';
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
  // List<String> myText = [
  //   "Track Budget",
  //   "Budget Goal",
  //   "Categories",
  //   "Reports",
  //   "My Passwords",
  //   "My Diary",
  //   "Chats",
  //   "Subscription",
  //   "Shopping"
  // ];
  // List<IconData> MyIcons = [
  //   Icons.analytics_outlined,
  //   Icons.track_changes,
  //   Icons.category,
  //   Icons.description_outlined,
  //   Icons.lock,
  //   Icons.menu_book,
  //   Icons.forum_outlined,
  //   Icons.subscriptions_outlined,
  //   Icons.shopping_cart_outlined
  // ];
  final List<Map<String, dynamic>> quickLinks = [
    {'icon': Icons.show_chart, 'label': 'Track budget'},
    {'icon': Icons.track_changes, 'label': 'Budget Goal'},
    {'icon': Icons.category, 'label': 'Categories'},
    {'icon': Icons.insert_chart, 'label': 'Reports'},
    {'icon': Icons.lock, 'label': 'My Passwords'},
    {'icon': Icons.book, 'label': 'My Diary'},
    {'icon': Icons.chat, 'label': 'Chats'},
    {'icon': Icons.subscriptions, 'label': 'Subscription'},
    {'icon': Icons.shopping_cart, 'label': 'Shopping'},
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
    ShoppingScreen()
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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
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
                    mainAxisSpacing: 10,
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
                    text: quickLinks[index]['label'],
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
