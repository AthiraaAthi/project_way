import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/earnings_screen/earnings_screen.dart';
import 'package:project_way/view/login_screen/login_screen.dart';
import 'package:project_way/view/screen/responsive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedValue = 1;
  void _showDialog() {
    MediaQuery.of(context).size.width < 600
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return Container(
                      height: 350,
                      width: 330,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Select Language',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 60,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.DefaultGrey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0.1,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Malayalam",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                  Radio<int>(
                                    value: 1,
                                    groupValue: _selectedValue,
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        _selectedValue = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              height: 60,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.DefaultGrey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0.1,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'English',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                  Radio<int>(
                                    value: 2,
                                    groupValue: _selectedValue,
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        _selectedValue = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      Locale selectedLocale =
                                          _selectedValue == 1
                                              ? Locale('ml')
                                              : Locale('en');
                                      context.setLocale(selectedLocale);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Next  >",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                          0xff07104E,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        : showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return Container(
                      height: 500,
                      width: 530,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Select Language',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 80,
                              width: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.DefaultGrey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: 0.5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          context.setLocale(Locale(
                                              'ml')); // Change to Malayalam
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Malayalam",
                                          style: TextStyle(fontSize: 23),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Transform.scale(
                                      scale: 2,
                                      child: Radio<int>(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: _selectedValue,
                                        onChanged: (int? newValue) {
                                          setState(() {
                                            _selectedValue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 80,
                              width: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.DefaultGrey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: 0.5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          context.setLocale(Locale(
                                              'en')); // Change to English
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'English',
                                          style: TextStyle(fontSize: 23),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Transform.scale(
                                      scale: 2,
                                      child: Radio<int>(
                                        value: 2,
                                        groupValue: _selectedValue,
                                        onChanged: (int? newValue) {
                                          setState(() {
                                            _selectedValue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      Locale selectedLocale =
                                          _selectedValue == 1
                                              ? Locale('ml')
                                              : Locale('en');
                                      context.setLocale(selectedLocale);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Next  >",
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                          0xff07104E,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }

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
            tr('profilescreen.appBarTitle'),
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
                        tr('profilescreen.name'),
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
                  height: 80,
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
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 280,
                    child: ListTile(
                      leading: Icon(
                        Icons.g_translate_rounded,
                        color: ColorConstant.defIndigo,
                        size: 30,
                      ),
                      title: Text(
                        tr('profilescreen.language'),
                        style: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                      trailing: InkWell(
                        //FOR DIALOG BOX
                        onTap: () {
                          _showDialog();
                        },
                        child: Text(
                          tr('profilescreen.change'),
                          style: TextStyle(
                              color: ColorConstant.defIndigo,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 380,
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
                    children: [
                      Container(
                        height: 200,
                        child: Image.asset(ImageConstant.Trophy),
                      ),
                      Text(
                        tr('profilescreen.balance'),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text(
                        tr('profilescreen.referralCount'),
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
                              tr('profilescreen.viewMore'),
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
                        tr('profilescreen.referToEarn'),
                        style: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
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
                                  fontWeight: FontWeight.w900, fontSize: 30),
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 130,
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
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 280,
                    child: ListTile(
                      leading: Icon(
                        Icons.g_translate_rounded,
                        color: ColorConstant.defIndigo,
                        size: 50,
                      ),
                      title: Text(
                        "English",
                        style: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontWeight: FontWeight.w800,
                            fontSize: 27),
                      ),
                      trailing: InkWell(
                        //FOR DIALOG BOX
                        onTap: () {},
                        child: Text(
                          "Change",
                          style: TextStyle(
                              color: ColorConstant.defIndigo,
                              fontWeight: FontWeight.w900,
                              fontSize: 27),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 650,
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
                    children: [
                      Container(
                        height: 350,
                        child: Image.asset(ImageConstant.Trophy),
                      ),
                      Text(
                        "₹ 1200.52",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Referal Count : 12",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
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
                        height: 20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
