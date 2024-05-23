import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/passwords_screen/password_widget.dart';

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
    return Scaffold(
      backgroundColor: ColorConstant.bgBlue,
      appBar: AppBar(
        backgroundColor: ColorConstant.defIndigo,
        title: Text(
          "My Passwords",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
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
                                children: [
                                  Text(
                                    "Add Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: websiteController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12.0),
                                        border: InputBorder.none,
                                        hintText: "Website",
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: desController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText: "Description",
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
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: passController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "press your thumb here to secure your password",
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
                                    "Thumb impression captured successfully",
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
                                          'website': websiteController.text,
                                          'description': desController.text,
                                          'password': passController.text,
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
                                          color: ColorConstant.defIndigo,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "Submit",
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
                          )),
                    );
                  },
                );
              },
              child: Text(
                "Add New",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
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
                                    "Edit Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: websiteController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12.0),
                                        border: InputBorder.none,
                                        hintText: "Website",
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: desController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText: "Description",
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
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: passController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "you alrdy added your thumb impression for the password.if you want to change that,pls click below",
                                    style: TextStyle(
                                        color: ColorConstant.defGreen,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "click here to change thumb impression data",
                                    style: TextStyle(
                                        color: ColorConstant.defIndigo,
                                        fontSize: 11.5,
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
                                      height: 45,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: ColorConstant.defIndigo,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "Submit",
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
                          )),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
