import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/passwords_screen/password_widget.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({super.key});

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
                          height: 500,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  "Add Password",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12.0),
                                        border: InputBorder.none,
                                        hintText: "Website",
                                        hintStyle: TextStyle(fontSize: 15)),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12.0),
                                        border: InputBorder.none,
                                        hintText: "Description",
                                        hintStyle: TextStyle(fontSize: 15)),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12.0),
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "press your thumb here to secure your password",
                                  style: TextStyle(fontSize: 12.5),
                                ),
                              ],
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
        child: Column(
          children: [
            PasswordWidget(
                onDeleteTap: () {},
                onEditTap: () {},
                title: "My Web password",
                link: "http:wedding.com",
                content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                pass: "password:   *************")
          ],
        ),
      ),
    );
  }
}
