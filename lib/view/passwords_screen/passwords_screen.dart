import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/passwords_screen/password_widget.dart';
import 'package:project_way/view/screen/responsive.dart';

class PasswordsScreen extends StatefulWidget {
  const PasswordsScreen({super.key});

  @override
  State<PasswordsScreen> createState() => _PasswordsScreenState();
}

class _PasswordsScreenState extends State<PasswordsScreen> {
  final websiteController = TextEditingController();
  final desController = TextEditingController();
  final passController = TextEditingController();
  List<Map<String, String>> mylist = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
          backgroundColor: ColorConstant.defIndigo,
          title: MediaQuery.of(context).size.width < 600
              ? Text(
                  "passwordScreen.PasswordAppbar".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.locale.languageCode == 'en'
                          ? 20
                          : 18, //we can change the font according to the lang
                      fontWeight: FontWeight.w500),
                )
              : Text(
                  "passwordScreen.PasswordAppbar".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MediaQuery.of(context).size.width < 600
                              ? Container(
                                  height: 580,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text(
                                            "passwordScreen.addPass".tr(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            height: 50,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              controller: websiteController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 12.0),
                                                border: InputBorder.none,
                                                hintText:
                                                    "passwordScreen.websiteHint"
                                                        .tr(),
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 100,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              controller: desController,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "passwordScreen.desHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 50,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              controller: passController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "passwordScreen.passHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "passwordScreen.thumbInstruction"
                                                .tr(),
                                            style: TextStyle(fontSize: 12.5),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    ImageConstant.fingerPrint),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "passwordScreen.thumbSuccess".tr(),
                                            style: TextStyle(
                                                color: ColorConstant.defGreen,
                                                fontSize: 11.5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                mylist.add({
                                                  'website':
                                                      websiteController.text,
                                                  'description':
                                                      desController.text,
                                                  'password':
                                                      passController.text,
                                                });
                                              });

                                              Navigator.pop(context);
                                              websiteController.clear();
                                              desController.clear();
                                              passController.clear();
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.defIndigo,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  "passwordScreen.passSubmit"
                                                      .tr(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              :
                              //FOR TAB DIALOG
                              Container(
                                  height: 780,
                                  width: 540,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text(
                                            "passwordScreen.addPass".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            height: 70,
                                            width: 450,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              style: TextStyle(fontSize: 20),
                                              controller: websiteController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 12.0),
                                                border: InputBorder.none,
                                                hintText:
                                                    "passwordScreen.websiteHint"
                                                        .tr(),
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 150,
                                            width: 450,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              style: TextStyle(fontSize: 20),
                                              controller: desController,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "passwordScreen.desHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 70,
                                            width: 450,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              style: TextStyle(fontSize: 20),
                                              controller: passController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "passwordScreen.passHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "passwordScreen.thumbInstruction"
                                                .tr(),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    ImageConstant.fingerPrint),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "passwordScreen.thumbSuccess".tr(),
                                            style: TextStyle(
                                                color: ColorConstant.defGreen,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                mylist.add({
                                                  'website':
                                                      websiteController.text,
                                                  'description':
                                                      desController.text,
                                                  'password':
                                                      passController.text,
                                                });
                                              });

                                              Navigator.pop(context);
                                              websiteController.clear();
                                              desController.clear();
                                              passController.clear();
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 55,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.defIndigo,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  "passwordScreen.passSubmit"
                                                      .tr(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        );
                      },
                    );
                  },
                  child: MediaQuery.of(context).size.width < 600
                      ? Text(
                          "passwordScreen.addNew".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "passwordScreen.addNew".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        )),
            )
          ],
        ),
        body: ResponsiveWidget(
          mobile: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 18,
              right: 15,
            ),
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PasswordWidget(
                  link: mylist[index]['website']!,
                  content: mylist[index]['description']!,
                  pass: mylist[index]['password']!,
                  onDeleteTap: () {
                    ///////DELETE//////
                    setState(() {
                      mylist.removeAt(index);
                    });
                  },
                  onEditTap: () {
                    /////////EDITING//////////
                    showDialog(
                      context: context,
                      builder: (context) {
                        websiteController.text = mylist[index]['website']!;
                        desController.text = mylist[index]['description']!;
                        passController.text = mylist[index]['password']!;
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 580,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "passwordScreen.editPass".tr(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        controller: websiteController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText:
                                              "passwordScreen.websiteHint".tr(),
                                          hintStyle: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        controller: desController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText:
                                              "passwordScreen.desHint".tr(),
                                          hintStyle: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        controller: passController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText:
                                              "passwordScreen.passHint".tr(),
                                          hintStyle: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "passwordScreen.thumbChangeInstruction"
                                          .tr(),
                                      style: TextStyle(
                                        color: ColorConstant.defGreen,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "passwordScreen.thumbChange".tr(),
                                      style: TextStyle(
                                          color: ColorConstant.defIndigo,
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          mylist[index]['website'] =
                                              websiteController.text;
                                          mylist[index]['description'] =
                                              desController.text;
                                          mylist[index]['password'] =
                                              passController.text;
                                          websiteController.clear();
                                          desController.clear();
                                          passController.clear();
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: ColorConstant.defIndigo,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            "passwordScreen.passSubmit".tr(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          //for TAB///////////
          tab: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 18,
              right: 15,
            ),
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PasswordWidget(
                  link: mylist[index]['website']!,
                  content: mylist[index]['description']!,
                  pass: mylist[index]['password']!,
                  onDeleteTap: () {
                    ///////DELETE//////
                    setState(() {
                      mylist.removeAt(index);
                    });
                  },
                  onEditTap: () {
                    /////////EDITING//////////
                    showDialog(
                      context: context,
                      builder: (context) {
                        websiteController.text = mylist[index]['website']!;
                        desController.text = mylist[index]['description']!;
                        passController.text = mylist[index]['password']!;
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 780,
                            width: 540,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "passwordScreen.editPass".tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 70,
                                      width: 450,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        style: TextStyle(fontSize: 22),
                                        controller: websiteController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText:
                                              "passwordScreen.websiteHint".tr(),
                                          hintStyle: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 150,
                                      width: 450,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        style: TextStyle(fontSize: 22),
                                        controller: desController,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 16.0,
                                                    vertical: 12.0),
                                            border: InputBorder.none,
                                            hintText:
                                                "passwordScreen.desHint".tr(),
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 70,
                                      width: 450,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        style: TextStyle(fontSize: 22),
                                        controller: passController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText:
                                              "passwordScreen.passHint".tr(),
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        "passwordScreen.thumbChangeInstruction"
                                            .tr(),
                                        style: TextStyle(
                                          color: ColorConstant.defGreen,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "passwordScreen.thumbChange".tr(),
                                      style: TextStyle(
                                          color: ColorConstant.defIndigo,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          mylist[index]['website'] =
                                              websiteController.text;
                                          mylist[index]['description'] =
                                              desController.text;
                                          mylist[index]['password'] =
                                              passController.text;
                                          websiteController.clear();
                                          desController.clear();
                                          passController.clear();
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        height: 55,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: ColorConstant.defIndigo,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            "passwordScreen.passSubmit".tr(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
